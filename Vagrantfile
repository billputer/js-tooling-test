# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "coffee-test"

  config.vm.box = "trusty64"

  config.vm.network :forwarded_port, guest: 7474, host: 7474

  config.vm.provision :shell, :path => "setup.sh"
end
