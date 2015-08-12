#
# Cookbook Name:: php_setup
# Recipe:: default
#
# Copyright 2015, GIC Co.,Ltd.
#


case node[:platform_family]
when "rhel"
	template "php.ini" do
		path "/etc/php.ini"
		source "php.ini.erb"
		mode 0644
		notifies :restart, 'service[httpd]'
		action :nothing
	end

	template "phpinfo.php" do
		path "/var/www/html/phpinfo.php"
		source "phpinfo.php.erb"
		mode 0755
		action :nothing
	end

	package "php" do
		action :install
		notifies :create, resources( :template => "php.ini")
		notifies :create, resources( :template => "phpinfo.php" )
	end

	package "php-mysql" do
		action :install
	end

when "debian"
	template "phpinfo.php" do
		path "/var/www/phpinfo.php"
		source "phpinfo.php.erb"
		mode 0755
		action :nothing
	end

	template "php.ini" do
		path "/etc/php5/apache2/php.ini"
		source "php.ini.erb"
		mode 0644
		notifies :restart, 'service[apache2]'
		action :nothing
	end

	%w[php5 php5-cli php5-gd php5-fpm php5-mysql].each do |pkg|
		package pkg do
			action :install
			notifies :create, resources(:template => "php.ini")
			notifies :create, resources(:template => "phpinfo.php" )
		end
	end
end
