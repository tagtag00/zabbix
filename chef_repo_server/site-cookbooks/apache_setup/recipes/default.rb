#
# Cookbook Name:: apache_setup
# Recipe:: default
#
# Copyright 2015, GIC Co.,Ltd.
#

case node[:platform_family]
when "rhel"
	template "httpd.conf" do
		path "/etc/httpd/conf/httpd.conf"
		source "httpd.conf.erb"
		mode 0644
		variables(
			:DocumentRoot	=> node['apache']['DocumentRoot'],
			:Port 			=> node['apache']['Port'],
			:User 			=> node['apache']['User'],
			:Group 			=> node['apache']['Group'],
			:ServerName 	=> node['apache']['ServerName'],
			:ServerAdmin	=> node['apache']['ServerAdmin'],
			:HostnameLookups => node['apache']['HostnameLookups'],
			:addtext		=> node['apache']['addtext'],
			:EnableSendfile	=> node['apache']['EnableSendfile']
		)
		notifies :restart, 'service[httpd]'
		action :nothing
	end
	
	%w[httpd].each do |pkg|
		package pkg do
			action :install
			notifies :create, resources( :template => "httpd.conf" )
		end
	end

	service "httpd" do
		action [:start, :enable]
	end

when "debian"
	template "default" do
		path "/etc/apache2/sites-available/default"
		source "default.erb"
		mode 0644
		variables(
			:DocumentRoot	=> node['apache']['DocumentRoot'],
			:Port 			=> node['apache']['Port'],
			:ServerAdmin	=> node['apache']['ServerAdmin']
		)
		action :nothing
	end

	template "apache.conf" do
		path "/etc/apache2/apache2.conf"
		source "apache2.conf.erb"
		mode 0644
		variables(
			:User 			=> node['apache']['User'],
			:Group 			=> node['apache']['Group'],
			:EnableSendfile	=> node['apache']['EnableSendfile']
		)
		action :nothing
	end

	template "ports.conf" do
		path "/etc/apache2/ports.conf"
		source "ports.conf.erb"
		mode 0644
		variables(
			:Port 			=> node['apache']['Port']
		)
		action :nothing
	end

	template "security" do
		path "/etc/apache2/conf.d/security"
		source "security.erb"
		mode 0644
		action :nothing
	end

	package "apache2" do
		action :install
		notifies :create, resources( :template => "default")
		notifies :create, resources( :template => "apache.conf")
		notifies :create, resources( :template => "ports.conf")
		notifies :create, resources( :template => "security")
		notifies :restart, 'service[apache2]'
	end

	service "apache2" do
		action [:start, :enable]
	end
end


