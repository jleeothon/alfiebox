#
# Cookbook Name:: alfiecookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_package 'git'
apt_package 'bison'
apt_package 'flex'
apt_package 'libxml2-dev'
apt_package 'curl'
apt_package 'libffi6'
apt_package 'libffi-dev'

apt_package 'python3.4'
apt_package 'python3-pip'
apt_package 'python3.4-dev'
apt_package 'python3.4-venv'

# TODO install Ruby 2.2
# TODO pip3 install jinja2
# TODO fix language


template "#{Dir.home('vagrant')}/.bashrc" do
  source "bashrc"
  owner "vagrant"
end
