# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.provision"shell", inline: "hostname"
  config.vm.provision "shell", path: "scripts/update.sh"
  config.vm.provider :virtualbox do |virtualbox, override|
    virtualbox.customize ["modifyvm", :id, "--memory", 2048]
  end
  
  config.vm.provider :lxc do |lxc, override|
    override.vm.box = "visibilityspots/centos-7.x-minimal"
  end

  config.vm.define "nomadserver" do |nomadserver|
    nomadserver.vm.hostname = "SERVER"
    nomadserver.vm.provision "shell", path: "scripts/server_config.sh"
    nomadserver.vm.network "private_network", ip: "192.168.1.4", virtualbox__intnet: true, auto_config: true
  end
  
  config.vm.define "nomadagent1" do |nomadagent1|
    nomadagent1.vm.hostname = "AGENT1"
    nomadagent1.vm.provision "shell", path: "scripts/agent_config.sh"
    nomadagent1.vm.network "private_network", ip: "192.168.1.5", virtualbox__intnet: true, auto_config: true
  end  
  config.vm.define "nomadagent2" do |nomadagent2|
    nomadagent2.vm.hostname = "AGENT2"
    nomadagent2.vm.provision "shell", path: "scripts/agent_config.sh"
    nomadagent2.vm.network "private_network", ip: "192.168.1.6", virtualbox__intnet: true, auto_config: true
  end
end
