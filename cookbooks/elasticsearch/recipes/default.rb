#
# Cookbook:: elasticsearch
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'elasticsearch' do
    action :install
end

service 'elasticsearch' do
    action :stop
    ignore_failure true
end

cookbook_file "/etc/elasticsearch/elasticsearch.yml" do
    source "elasticsearch.yml"
    owner "elasticsearch"
    group "elasticsearch"
    mode 0600
    notifies :restart, "service[elasticsearch]"
end

service 'elasticsearch' do
    action [:enable, :start]
end
