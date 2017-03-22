#
# Cookbook Name:: alfiecookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_repository 'brightbox-ruby-ng' do
  # uri "http://ppa.launchpad.net/nginx/php5/ubuntu"
  # uri "https://www.brightbox.com/docs/ruby/ubuntu/"
  uri "http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu"
  components ['main']
end

apt_package 'ruby2.2'
apt_package 'ruby2.2-dev'

# script "install-ruby2.2" do
#   not_if do
#     expected = %w(ruby2.2 ruby2.2-dev:amd64)
#     actual = `dpkg-query -W -f='${binary:Package}\n' ruby2.2*`.split
#     !(expected - actual).empty?
#   end
#   interpreter "bash"
#   code <<-END
#     apt-add-repository -y ppa:brightbox/ruby-ng
#     apt-get update -y
#     apt-get install -y ruby2.2
#     apt-get install -y ruby2.2-dev
#   END
# end

# apt_package 'git'
# apt_package 'bison'
# apt_package 'flex'
# apt_package 'libxml2-dev'
# apt_package 'curl'
# apt_package 'libffi6'
# apt_package 'libffi-dev'
# apt_package 'libcurl4-openssl-dev'
# apt_package 'libpq-dev'
# apt_package 'gdb'
# apt_package 'valgrind'

# apt_package 'python3.4'
# apt_package 'python3-pip'
# apt_package 'python3.4-dev'
# apt_package 'python3.4-venv'

# apt_package 'linux-image-extra-3.13.0-95-generic'
# apt_package 'linux-image-extra-virtual'

# template "#{Dir.home('vagrant')}/.bashrc" do
#   source "bashrc"
#   owner "vagrant"
# end


# script "install-jinja2" do
#   not_if do
#     `pip3 freeze`.include? "Jinja2==2.8"
#   end
#   interpreter "bash"
#   code <<-END
#     pip3 install -Iv Jinja2==2.8
#   END
# end
