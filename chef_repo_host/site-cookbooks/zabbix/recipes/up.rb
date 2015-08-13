#
# Cookbook Name:: zabbix
# Recipe:: up
#
# Copyright 2015, GIC Co.,Ltd.
#

service "zabbix-server" do
  action [:start, :enable]
end

service "httpd" do
  action :restart
end