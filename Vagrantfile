# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
BOX_IMAGE = "centos/7"
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "server" do |subconfig|
     subconfig.vm.box = BOX_IMAGE
     subconfig.vm.hostname = "server"
	 subconfig.vm.provision "shell", path: "scriptsPE/update.sh"
	 subconfig.vm.provision "shell", path: "scriptsPE/consul_install.sh"
	 subconfig.vm.provision "shell", path: "scriptsPE/nomad_install.sh"
	 subconfig.vm.provision "shell", path: "scriptsPE/server_config.sh"
	 subconfig.vm.provision "shell", inline: <<-SHELL
		sudo consul join 10.0.0.11
		sudo consul join 10.0.0.12
	SHELL
     subconfig.vm.network :private_network, ip: "10.0.0.10", virtualbox__intnet: true, auto_config: true
	 config.vm.provider :virtualbox do |virtualbox, override|
      virtualbox.customize ["modifyvm", :id, "--memory", 2048]
	 
  end

  (1..NODE_COUNT).each do |i|
     config.vm.define "node#{i}" do |subconfig|
       subconfig.vm.box = BOX_IMAGE
       subconfig.vm.hostname = "node#{i}"
	   subconfig.vm.provision "shell", path: "scriptsPE/update.sh"
	   subconfig.vm.provision "shell", path: "scriptsPE/consul_install.sh"
	   subconfig.vm.provision "shell", path: "scriptsPE/nomad_install.sh"
       subconfig.vm.network :private_network, ip: "10.0.0.#{i + 10}", virtualbox__intnet: true, auto_config: true
	   config.vm.provider :virtualbox do |virtualbox, override|
		virtualbox.customize ["modifyvm", :id, "--memory", 2048]
     end
   end
   
   config.vm.define "node1" do |subconfig|
	subconfig.vm.provision "shell", path: "scriptsPE/config_node1.sh"
   end
   
   config.vm.define "node2" do |subconfig|
	subconfig.vm.provision "shell", path: "scriptsPE/config_node2.sh"
   end
 end
