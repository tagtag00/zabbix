#
# Cookbook Name:: mysql_setup
# Recipe:: default
#
# Copyright 2015, GIC Co.,Ltd.
#

# mariaDBの削除
%w[mariadb mariadb-devel mariadb-libs].each do |p|
	package p do
		action [:remove]
	end
end


# mysqlのインストール
case node[:platform_family]
when "rhel"
	template "my.cnf" do
		path "/etc/my.cnf"
		source "my.cnf.erb"
		mode 0644
		notifies :restart, 'service[mysqld]'
		action :nothing
	end

	%w[mysql mysql-devel mysql-server].each do |p|
		package p do
			action :install
			notifies :create, resources( :template => "my.cnf" )
		end
	end

	service "mysqld" do
		action [:start, :enable]
	end

when "debian"
	template "my.cnf" do
		path "/etc/my.cnf"
		source "my.cnf.erb"
		mode 0644
		notifies :restart, 'service[mysql]'
		action :nothing
	end

	%w[mysql-server].each do |p|
		package p do
			action :install
			notifies :create, resources( :template => "my.cnf" )
		end
	end

	service "mysql" do
		# supports [ :restart, :reload ]
		# supports :restart=>true, :reload=>true, :status=>true
		action [:start, :enable]
	end
end



