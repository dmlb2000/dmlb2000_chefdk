#
# Cookbook Name:: dmlb2000_chef
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'dmlb2000_users'
package 'libvirt-devel'
package 'libffi-devel'
package 'zlib-devel'
link '/etc/alternatives/ld' do
  to '/usr/bin/ld.gold'
end
include_recipe 'build-essential'
include_recipe 'vagrant'
include_recipe 'chef-dk'
