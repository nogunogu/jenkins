#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# sudo apt-get install software-properties-common
package 'software-properties-common'

# sudo add-apt-repository ppa:openjdk-r/ppa
execute 'add-apt-repository ppa:openjdk-r/ppa'

execute 'apt-get update'

# sudo apt-get install openjdk-8-jre-headless
package 'openjdk-8-jre-headless'

apt_repository 'jenkins' do
  uri          'http://pkg.jenkins-ci.org/debian'
  distribution 'binary/'
  key          'https://jenkins-ci.org/debian/jenkins-ci.org.key'
end

# sudo apt-get install jenkins
package 'jenkins' do
  options '--force-yes'
end
