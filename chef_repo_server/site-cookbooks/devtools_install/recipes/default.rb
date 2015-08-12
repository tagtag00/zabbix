#
# Cookbook Name:: devtools_install
# Recipe:: default
#
# Copyright 2015, GIC Co.,Ltd.
#

#
# developtoolsのインストール
#
case node[:platform_family]
when "rhel"
	bash "devtools install" do
    	user "root"
    	code 'yum -y groupinstall "Development Tools"'
    	action :run
	end
when "debian"
	bash "devtools install" do
		user "root"
		code "apt-get -y install build-essential"
		action :run
	end
end

# 
# tree-1.6.0 インストール
#
%w[gcc wget].each do |pkg|
  package pkg do
    action :install
  end
end

bash "tree install" do
  user 'root'
  code <<-EOC
    cd /tmp
    wget ftp://mama.indstate.edu/linux/tree/tree-1.6.0.tgz
    tar zxvf tree-1.6.0.tgz 
    cd tree-1.6.0
    make 
    sudo make install
  EOC
  not_if { ::File.exists? "/tmp/tree-1.6.0.tgz" }
end
