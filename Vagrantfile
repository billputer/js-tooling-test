# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "coffee-test"

  config.vm.box = "trusty64"

  config.vm.network "private_network", ip: "172.16.250.142"

  config.vm.provision :shell, :path => "setup.sh"
end
