# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true

  config.vm.box = "hashicorp/precise64"

  config.vm.define "control", primary: true do |h|
    h.vm.network "private_network", ip: "192.168.135.10"
    h.vm.provision :shell, path: "create_ssh_key.sh"
  end

  config.vm.define "host01" do |h|
    h.vm.network "private_network", ip: "192.168.135.101"
    h.vm.provision :shell, path: "add_ssh_key.sh"
  end
end