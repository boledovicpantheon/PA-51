# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_NAME = "bento/ubuntu-22.04" 
N = 2   # number of nodes

Vagrant.configure("2") do |config|

  config.vbguest.no_install = false
  config.vbguest.auto_update = false #if true, vagrant fails on `umount /mnt`, need to figure out
  config.vbguest.no_remote = true
  config.vbguest.auto_reboot = true

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end
  
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "setup/base.yml"
    ansible.verbose = "true" # same as `-v`
    ansible.become = "true" #sudo
  end
  

###  Master node
  config.vm.define "master" do |master|
    master.vm.box = "#{IMAGE_NAME}"
    master.vm.network "private_network", ip: "192.168.56.10"
    master.vm.hostname = "master"

    master.vm.provider "virtualbox" do |v| 
      v.memory = 2048
      v.cpus = 2
    end

    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup/master.yml"
      ansible.verbose = "true" # same as `-v`
      ansible.become = "true" #sudo
      ansible.extra_vars = {
          node_ip: "192.168.56.10",
      }
    end
  end

  (1..N).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.box = "#{IMAGE_NAME}"
      node.vm.network "private_network", ip: "192.168.56.#{i + 10}"
      node.vm.hostname = "node-#{i}"
      
      node.vm.provision "ansible" do |ansible|
        ansible.playbook = "setup/node.yml"
        ansible.verbose = "true" # same as `-v`
        ansible.become = "true" #sudo
        ansible.extra_vars = {
            node_ip: "192.168.56.#{i + 100}",
        }
      end
    end
  end
end




