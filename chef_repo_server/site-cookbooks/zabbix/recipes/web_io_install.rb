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

when "debian"

end
