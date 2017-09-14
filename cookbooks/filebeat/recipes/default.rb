#
# Cookbook:: filebeat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'filebeat' do
    action :install
end

service 'filebeat' do
    action :stop
    ignore_failure true
end

template '/etc/filebeat/filebeat.yml' do
    source 'filebeats.yml.erb'
    notifies :restart, "service[filebeat]"
end

service 'filebeat' do
   action [:enable, :start]
   supports :restart => true
end
