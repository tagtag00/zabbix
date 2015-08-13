#
# Cookbook Name:: apache
# Recipe:: install
#
# Copyright 2015, GIC Co.,Ltd.
#

case node[:platform_family]
when "rhel"
	template "httpd.conf" do
		path "/etc/httpd/conf/httpd.conf"
		source "httpd.conf.22.erb"
		mode 0644
		variables(
			:ServerTokens => node['apache']['ServerTokens'],
			:KeepAlive 		=> node['apache']['KeepAlive'],
			:DocumentRoot	=> node['apache']['DocumentRoot'],
			:Port 				=> node['apache']['Port'],
			:User 				=> node['apache']['User'],
			:Group 				=> node['apache']['Group'],
			:ServerName 	=> node['apache']['ServerName'],
			:ServerAdmin	=> node['apache']['ServerAdmin'],
			:HostnameLookups => node['apache']['HostnameLookups'],
			:EnableSendfile	=> node['apache']['EnableSendfile']
		)
		notifies :restart, 'service[httpd]'
		action :nothing
	end

	package "httpd" do
		action :install
		notifies :create, resources( :template => "httpd.conf" )
	end

	service "httpd" do
		action [:start, :enable]
	end

when "debian"
	package "apache2" do
		action :install
	end

	service "apache2" do
		action [:start, :enable]
	end
end


