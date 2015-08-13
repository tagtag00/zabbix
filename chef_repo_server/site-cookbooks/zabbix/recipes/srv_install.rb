#
# Cookbook Name:: zabbix
# Recipe:: srv_install
#
# Copyright 2015, GIC Co.,Ltd.
#

case node[:platform_family]
when "rhel"
  package "ntp" do
    action :install
  end

  service "ntpd" do
    action [:start, :enable]
  end

  # os_version = node['platform_version']
  package "epel-release" do
    action :install
  end

  %w[zabbix22 zabbix22-server zabbix22-server-mysql].each do |pkg|
    package pkg do
      action :install
    end
  end

when "debian"

end
