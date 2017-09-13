
#
# Cookbook:: kibana
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

yum_repository 'kibana' do
    description "Kibana 5.x repo"
    baseurl "https://artifacts.elastic.co/packages/5.x/yum"
    gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    enabled true
    gpgcheck true
    fastestmirror_enabled true
    action :create
end

package 'kibana' do
    action :install
end

service 'kibana' do
    action [:enable, :start]
end
