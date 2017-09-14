
#
# Cookbook:: kibana
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'kibana' do
    action :install
end

service 'kibana' do
    action :stop
    ignore_failure true
end

cookbook_file "/etc/kibana/kibana.yml" do
    source "kibana.yml"
    owner "kibana"
    group "kibana"
    mode 0600
    notifies :restart, "service[kibana]"
end

service 'kibana' do
    action [:enable, :start]
end
