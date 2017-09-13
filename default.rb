#
# Cookbook Name:: cookbooks/apache
# Recipe:: default
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# Install apache
package "httpd" do
    action :install
end

# Start Service
service "httpd" do
    action: [:enable, :start]
end
# Ensure that the service is enabled or starts on reboot
# Write out our homepage
cookbook_file "/var/www/html" do
    source "index.html"
    mode "0644"
end
