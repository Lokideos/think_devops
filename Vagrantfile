# -*- mode: ruby -*-
# vi: set ft=ruby :

CONTROL_IP_ADDRESS = "192.168.135.10"
HOST01_IP_ADDRESS = "192.168.135.101"
NETWORK_NAME = "private_network"

Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true

  config.vm.box = "hashicorp/precise64"

  config.vm.define "control", primary: true do |h|
    h.vm.network NETWORK_NAME, ip: CONTROL_IP_ADDRESS
    h.vm.provision :shell, path: "create_ssh_key.sh"
  end

  config.vm.define "host01" do |h|
    h.vm.network NETWORK_NAME, ip: HOST01_IP_ADDRESS
    h.vm.provision :shell, path: "add_ssh_key.sh"
  end
end