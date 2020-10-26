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

After the vagrant environment is set up successfully, type

```
    vagrant ssh <nomadserver> -- -L 8500:localhost:8500
```

**How was this developed?**

We made use of multiple sources to expand our knowledge of Vagrant multi-machine uses which can all be found at the bottom of the *README.md*

Variables were used like we were taught in class to keep the file as clear as possible.

Next up we made use of shell scripts to install *Docker*, *Nomad* and *Consul* onto every machine that was being set up using *systemd* with the foreseen yum repository from *HashiCorp*. Together with this we check for updates for the operating system to keep the machine up to date.

We chose to configure the *Consul* and *Nomad* server first so that the agents which will be created later can immediately join as members.

Now you could ask, why did we mix both inline and external scripts? 

The answer is simple, just as simple as we tried to make the Vagrantfile as clear and simple as possible. We wanted to test our skills and see if we could use both without causing issues in the script. It's also easier to see the difference in configuration (of Nomad and Consul) between the agents and the server so that you don't have to open the external scripts for all machines and spotting the differences.

The agents have been defined so that double code has been prevented. With a nice and easy to use ".each" loop we define 2 nodes with a corresponding hostname and IP-address. Luckily the required configuration wasn't as complex as we thought and therefore we were able to use the same inline script for both nodes.

*Nomad* and *Consul* will restart after the configuration has been completed and your machines will be ready to use.

**How do I test if it actually works?**

To test if the Vagrantfile is working as intended, simply type the following command on the Nomad server to create a new template job:

```
    nomad job init webserver
```

This will create an example job file, but you can also use the already provided `webserver.hcl` file. The file will already be on your machine since it will be imported automatically using the file provisioner. When you're to start the webserver job; run the following command:

```
    nomad job run -address=http://10.0.0.10:4646 webserver
```

If the output says the job has been started correctly on the agents, you will know its working as intended.


**How do I check if all nodes are *Consul* and *Nomad* members?**

Simply type:

```
    consul members
```

```
    nomad node status -address=http://10.0.0.10:4646
```

https://www.consul.io/docs/agent/options.html

https://manski.net/2016/09/vagrant-multi-machine-tutorial/#starting-and-interacting-with-your-first-vm

https://learn.hashicorp.com/tutorials/consul/get-started-create-datacenter?in=consul%2Fgetting-started&fbclid=IwAR1lVFYM9e_ELX9v-aOq18Cet9bAxYZuKBYCOkCZHNP3F35l5h-NJgyyIGg
