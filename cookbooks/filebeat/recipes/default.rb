#
# Cookbook:: filebeat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
yum_repository 'Filebeat' do
    description "Filebeat 5.x repo"
    baseurl "https://artifacts.elastic.co/packages/5.x/yum"
    gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    enabled true
    gpgcheck true
    fastestmirror_enabled true
    action :create
end

package 'filebeat' do
    action :install
end

service 'filebeat' do
    action :stop
    ignore_failure true
end

template '/etc/filebeat/filebeat.yml' do
    source 'filebeats.yml.erb'
end
#cookbook_file "/etc/logstash/logstash.yml" do
#    source "logstash.yml"
#    owner "logstash"
#    group "logstash"
#    mode 0600
#    notifies :restart, "service[logstash]"
#end

#remote_directory '/etc/logstash/conf.d' do
#  source "conf.d"
#  owner "logstash"
#  group "logstash"
#  action :create
#end

#service 'logstash' do
#    action [:enable, :start]
#    supports :restart => true
#end
