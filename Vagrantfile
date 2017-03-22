# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.channel = "stable"
    chef.add_recipe "alfiecookbook"
    # chef.add_recipe "alfiecookbook::repos"
    # chef.add_recipe "alfiecookbook::grake"
    # chef.add_recipe "alfiecookbook::blog"
  end

  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  config.vm.synced_folder "alfieproject", "/home/vagrant/alfieproject", create: true

end
