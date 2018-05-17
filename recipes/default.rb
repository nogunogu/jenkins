#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# sudo apt-get install software-properties-common
package 'software-properties-common'

# sudo add-apt-repository ppa:openjdk-r/ppa
execute 'add-apt-repository ppa:openjdk-r/ppa'

# wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
remote_file '/tmp/jenkins-ci.org.key' do
  source 'https://pkg.jenkins.io/debian/jenkins-ci.org.key'
  notifies :run, 'execute[apt-key add /tmp/jenkins-ci.org.key]', :immediately
end

execute 'apt-key add /tmp/jenkins-ci.org.key' do
  action :nothing
end

# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
file '/etc/apt/sources.list.d/jenkins.list' do
  content 'deb http://pkg.jenkins.io/debian-stable binary/'
  notifies :run, 'execute[apt-get update]', :immediately
end

# sudo apt-get update
execute 'apt-get update' do
  action :nothing
end

# sudo apt-get install openjdk-8-jre-headless
package 'openjdk-8-jre-headless'

# sudo apt-get install jenkins
package 'jenkins' do
  action :remove
end

package 'jenkins' do
  options '--force-yes'
end
