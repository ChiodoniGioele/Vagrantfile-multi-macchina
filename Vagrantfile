# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Variabili
  BOX_IMAGE = "ubuntu/jammy64"
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  NAME_WEB = "web.m340"
  NAME_DB = "db.m340"
  
  # VM Web
  config.vm.define "web" do |web|
    
    web.vm.box = BOX_IMAGE
    web.ssh.insert_key = false
    web.vm.hostname = NAME_WEB
    
    # Imposta CPU e RAM
    web.vm.provider "virtualbox" do |vb|
      vb.name = NAME_WEB
      vb.memory = 2040 
      vb.cpus = 2      
    end
    
    # rete interna
    web.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: "intnet"
    # rete host-only
    web.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"

    # Share
    web.vm.synced_folder "./website", "/var/www/html"
    
    # Provisioning
    web.vm.provision "shell", path: "provision_web.sh"
  end


  # VM Database
  config.vm.define "db" do |db|
    db.vm.box = BOX_IMAGE
    db.ssh.insert_key = false
    db.vm.hostname = NAME_DB
    
    # CPU e RAM
    db.vm.provider "virtualbox" do |vb|
      vb.name = NAME_DB
      vb.memory = 2048
      vb.cpus = 2
    end

    # rete interna
    db.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: "intnet"
    
    # Provisioning
    db.vm.provision "shell", path: "provision_db.sh"
  end
end