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
apt_package 'libcurl4-openssl-dev'
apt_package 'libpq-dev'
apt_package 'gdb'
apt_package 'valgrind'

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
    expected = %w(ruby2.2 ruby2.2-dev:amd64)
    actual = `dpkg-query -W -f='${binary:Package}\n' ruby2.2*`.split
    !(expected - actual).empty?
  end
  interpreter "bash"
  code <<-END
    apt-add-repository -y ppa:brightbox/ruby-ng
    apt-get update -y
    apt-get install -y ruby2.2
    apt-get install -y ruby2.2-dev
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

script "set-postgres-password" do
  interpreter "bash"
  code <<-END
    su -l postgres -c "psql -c \\"alter user postgres password 'password';\\""
  END
end
