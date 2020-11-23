# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
BOX_IMAGE = "centos/7"
NODE_COUNT = 2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vbguest.auto_update = false
  config.vm.box = "centos/7"

  config.vm.provider :virtualbox do |virtualbox, override|
    virtualbox.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.define :server do |server|
    server.vm.hostname = "server"
    server.vm.network "private_network", ip: "10.0.0.10"

    # server.vm.provision "ansible_local" do |ansible|
    #   ansible.config_file = "ansible/ansible.cfg"
    #   ansible.playbook = "ansible/plays/server.yml"
    #   ansible.groups = {
    #     "servers" => ["server"],
    #     "servers:vars" => {"consul_master" => "yes", "consul_join" => "no", 
    #     "consul_server"=> "yes", "private_ip" => "10.0.0.10"}
    #   }
    # end

  end

#   config.vm.define :node1 do |node1|
#     node1.vm.hostname = "node1"
#     node1.vm.network "private_network", ip: "10.0.0.11"
  
#     node1.vm.provision "ansible_local" do |ansible|
#       ansible.config_file = "ansible/ansible.cfg"
#       ansible.playbook = "ansible/plays/server.yml"
#       ansible.groups = {
#         "nodes" => ["node1"],
#         "nodes:vars" => {"consul_master" => "no", "consul_join" => "yes", 
#         "consul_server"=> "no", "private_ip" => "10.0.0.11"},
#       }
#       ansible.host_vars = {
# #        "server" => {"crond__content" => "server_value"}
#       }
# #      ansible.verbose = '-vvv'
#     end

#  end

 (1..NODE_COUNT).each do |i|
  config.vm.define :"node#{i}" do |node|
    node.vm.box = BOX_IMAGE
    node.vm.hostname = "node#{i}"
    node.vm.network :private_network, ip: "10.0.0.#{i + 10}"
  end	
end

 config.vm.provision "ansible_local" do |ansible|
  ansible.config_file = "ansible/ansible.cfg"
  ansible.playbook = "ansible/plays/server.yml"
  ansible.groups = {
    "servers" => ["server"],
    "servers:vars" => {"consul_master" => "yes", "consul_join" => "no", 
    "consul_server"=> "yes", "private_ip" => "10.0.0.10"},
    "nodes" => ["node1", "node2"],
    "nodes:vars" => {"consul_master" => "no", "consul_join" => "yes", 
    "consul_server"=> "no", "private_ip" => "10.0.0.11"},
  }
  end
 
end

