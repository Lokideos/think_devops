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

  # From thinknetica repository

  config.vm.define 'dockerized' do |machine|
    machine.vm.box = "williamyeh/ubuntu-trusty64-docker"

    machine.vm.network "forwarded_port", guest: 80, host: 8080
    machine.vm.network "forwarded_port", guest: 5432, host: 8081
    machine.vm.network "forwarded_port", guest: 6379, host: 8082
  end


  config.vm.define 'empty_ubuntu' do |machine|
    machine.vm.box = 'generic/ubuntu1804'
    machine.vm.network "forwarded_port", guest: 22, host: 2222

    public_key = File.read("#{ENV['HOME']}/.ssh/id_rsa.pub")
    script = <<SCRIPT
      apt install -y python
      echo "#{public_key}" >> /home/vagrant/.ssh/authorized_keys
SCRIPT

    machine.vm.provision :shell, inline: script
  end
end
