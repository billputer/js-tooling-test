# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "js-tooling-test"

  config.vm.box = "trusty64"

  config.vm.network "private_network", ip: "172.16.250.142"

  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.synced_folder ".", "/srv/js-tooling-test"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/site.yml"
    ansible.extra_vars = { ansible_ssh_user: "vagrant", testing: true }

    #ansible.verbose = "vvvv"
  end
end
