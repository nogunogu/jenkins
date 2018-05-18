#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'java'

apt_repository 'jenkins' do
  uri          'http://pkg.jenkins-ci.org/debian'
  distribution 'binary/'
  key          'https://jenkins-ci.org/debian/jenkins-ci.org.key'
end

# sudo apt-get install jenkins
package 'jenkins' do
  options '--force-yes'
end
