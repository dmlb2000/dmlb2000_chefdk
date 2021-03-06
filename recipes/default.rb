#
# Cookbook Name:: dmlb2000_chef
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'dmlb2000_users'
package 'libvirt-daemon'
package 'libvirt-daemon-lxc'
package 'libvirt-daemon-kvm'
package 'libvirt-devel'
package 'libffi-devel'
package 'zlib-devel'
link '/etc/alternatives/ld' do
  to '/usr/bin/ld.gold'
end
include_recipe 'build-essential'
include_recipe 'vagrant'
include_recipe 'chef-dk'

%w(
  chef-client
  knife
).each do |bin|
  link "/usr/bin/#{bin}" do
    to "/opt/chef/bin/#{bin}"
  end
end

service 'libvirtd' do
  action [:enable, :start]
end
