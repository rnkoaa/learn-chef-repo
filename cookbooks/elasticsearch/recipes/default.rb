#
# Cookbook:: elasticsearch
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# cookbook_file "/etc/yum.repos.d/elasticsearch.repo" do
#    source "elasticsearch.repo"
#    owner "root"
#    group "root"
#    mode 0600
#    action :create_if_missing
#end

yum_repository 'elasticsearch' do
    description "Elasticsearch 5.x repo"
    baseurl "https://artifacts.elastic.co/packages/5.x/yum"
    gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    enabled true
    gpgcheck true
    fastestmirror_enabled true
    action :create
end

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


