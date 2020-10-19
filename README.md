# Nomad consul

The aim of this project is to provide a development environment based on [consul](https://www.consul.io) and [nomad](https://www.nomadproject.io) to manage container based microservices.

The following steps should make that clear;

bring up the environment by using [vagrant](https://www.vagrantup.com) which will create centos 7 virtualbox machine or lxc container.

The proved working vagrant providers used on an [ArchLinux](https://www.archlinux.org/) system are
* [vagrant-lxc](https://github.com/fgrehm/vagrant-lxc)
* [vagrant-libvirt](https://github.com/vagrant-libvirt/)
* [virtualbox](https://www.virtualbox.org/)

```bash
    $ vagrant up --provider lxc
    OR
    $ vagrant up --provider libvirt
    OR
    $ vagrant up --provider virtualbox
```

Once it is finished, you should be able to connect to the vagrant environment through SSH and interact with Nomad:

```bash
    $ vagrant ssh
    [vagrant@nomad ~]$
```

**To access the Web UI of Consul**
After the vagrant environment is set up correctly, type
```vagrant ssh <nomadserver> -- -L 8500:localhost:8500```


https://www.consul.io/docs/agent/options.html
https://manski.net/2016/09/vagrant-multi-machine-tutorial/#starting-and-interacting-with-your-first-vm
https://learn.hashicorp.com/tutorials/consul/get-started-create-datacenter?in=consul%2Fgetting-started&fbclid=IwAR1lVFYM9e_ELX9v-aOq18Cet9bAxYZuKBYCOkCZHNP3F35l5h-NJgyyIGg
