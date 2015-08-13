#
# Cookbook Name:: zabbix
# Recipe:: mysql_setting
#
# Copyright 2015, GIC Co.,Ltd.
#

execute "mysql-create-zabbix" do
  command "/usr/bin/mysql -u root --password=\"#{node['mysql']['root_password']}\"  < /tmp/grants.sql"
  action :nothing
end

template "/tmp/grants.sql" do
  owner "root"
  group "root"
  mode "0655"
  variables(
      :db_name     => node['zabbix']['db_name'],
      :db_user     => node['zabbix']['db_user'],
      :db_password => node['zabbix']['db_password']
  )
  notifies :run, "execute[mysql-create-zabbix]", :immediately
end

bash "mysql4zabbix setup" do
  user "root"
  cwd "/usr/share/zabbix-mysql"
  code <<-EOC
    mysql -u root --password=\"#{node['mysql']['root_password']}\" zabbix < schema.sql
    mysql -u root --password=\"#{node['mysql']['root_password']}\" zabbix < images.sql
    mysql -u root --password=\"#{node['mysql']['root_password']}\" zabbix < data.sql
  EOC
end

template "zabbix_server.conf" do
  path "/etc/zabbix/zabbix_server.conf"
  source "zabbix_server.conf.erb"
  owner "root"
  group "root"
  mode "0655"
  variables(
      :db_name     => node['zabbix']['db_name'],
      :db_user     => node['zabbix']['db_user'],
      :db_password => node['zabbix']['db_password']
  )
end
# /usr/share/zabbix-mysql/