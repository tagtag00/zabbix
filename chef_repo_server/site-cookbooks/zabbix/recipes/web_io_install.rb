#
# Cookbook Name:: zabbix
# Recipe:: web_io_install
#
# Copyright 2015, GIC Co.,Ltd.
#

case node[:platform_family]
when "rhel"
  %w[zabbix22-web zabbix22-web-mysql].each do |pkg|
    package pkg do
      action :install
    end
  end

  template "php4zabbix conf" do
    path "/etc/httpd/conf.d/zabbix.conf"
    source "zabbix.conf"
    owner "root"
    group "root"
    mode "0655"
  end

  bash "zabbix-web-jp" do
    user "root"
    code <<-EOC
      localedef -f UTF-8 -i ja_JP ja_JP
    EOC
  end

  package "ipa-pgothic-fonts" do
    action :install
  end

# 手動で/usr/share/zabbix/include/defines.inc.phpの下記の３行を修正
# define('ZBX_FONTPATH', '/usr/share/fonts/ipa-pgothic'); // where to search for font (GD > 2.0.18)
# define('ZBX_GRAPH_FONT_NAME', 'ipagp'); // font file name
# define('ZBX_FONT_NAME', 'ipagp');
# 
# httpdとzabbix-serverをrestart

when "debian"

end
