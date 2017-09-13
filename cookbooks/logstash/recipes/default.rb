#
# Cookbook:: logstash
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
yum_repository 'Logstash' do
    description "Logstash 5.x repo"
    baseurl "https://artifacts.elastic.co/packages/5.x/yum"
    gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    enabled true
    gpgcheck true
    fastestmirror_enabled true
    action :create
end

package 'logstash' do
    action :install
end

service 'logstash' do
    action :stop
    ignore_failure true
end

cookbook_file "/etc/logstash/logstash.yml" do
    source "logstash.yml"
    owner "logstash"
    group "logstash"
    mode 0600
    notifies :restart, "service[logstash]"
end

remote_directory '/etc/logstash/conf.d' do
  source 'conf.d'
  owner "logstash"
  group "logstash"
  action :create
end

service 'logstash' do
    action [:enable, :start]
end
