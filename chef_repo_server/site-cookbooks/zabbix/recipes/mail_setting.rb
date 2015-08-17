#
# Cookbook Name:: zabbix
# Recipe:: mail_setting
#
# Copyright 2015, GIC Co.,Ltd.
#

directory "/var/lib/zabbixsrv/alertscripts" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_directory "/var/lib/zabbixsrv/alertscripts" do
  source "mail_plugin"
  owner 'zabbix'
  mode '0755'
end