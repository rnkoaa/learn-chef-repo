#
# Cookbook:: logstash
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

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
  source "conf.d"
  owner "logstash"
  group "logstash"
  # action :create
end

service 'logstash' do
    action [:enable, :start]
    supports :restart => true
end
