#
# Cookbook Name:: security_disabled
# Recipe:: default
#
# Copyright 2015, GIC Co.,Ltd.
#

service "iptables" do
	action [:stop, :disable]
end

service "firewalld" do
	action [:stop, :disable]
end

template "/etc/selinux/config" do
	source "selinux.erb"
	action :nothing
end

execute "disable selinux enfocement" do
	only_if "which selinuxenabled && selinuxenabled"
	command "setenforce 0"
	action :run
	notifies :create, resources( :template => "/etc/selinux/config" )
end

