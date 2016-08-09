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

script "install-ruby2.2" do
  not_if do
    `ruby -v`.strip.between? "ruby 2.2", "ruby2.3"
  end
  interpreter "bash"
  code <<-END
    apt-add-repository -y ppa:brightbox/ruby-ng
    apt-get update -y
    apt-get install -y ruby2.2
  END
end

script "install-jinja2" do
  not_if do
    `pip3 freeze`.include? "Jinja2==2.8"
  end
  interpreter "bash"
  code <<-END
    pip3 install -Iv Jinja2==2.8
  END
end

template "/etc/apt/sources.list.d/postgresql.list" do
  source "postgresql.list"
end

script "install-postgresql" do
  not_if do
    `psql --version || true`.strip == "psql (PostgreSQL) 9.5.3"
  end
  interpreter "bash"
  code <<-END
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    apt-get update -y
    apt-get install -y postgresql-9.5 # You may need --force-yes
  END
end
