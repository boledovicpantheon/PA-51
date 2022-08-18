# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_NAME = "ubuntu/jammy64" #"bento/ubuntu-22.04" 
N = 2   # number of worker nodes
M = 1   # number of master nodes

Vagrant.configure("2") do |config|

# share cache between the boxes
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

# we will use this to pass the join command from master to the nodes
  config.vm.synced_folder ".", "/vagrant", disabled: false   

# disable automatic box update checking
config.vbguest.no_install = true
config.vbguest.auto_update = false 
config.vbguest.no_remote = true
config.vbguest.auto_reboot = true

config.vm.provision "ansible_local" do |ansible|
  ansible.provisioning_path = "/vagrant"
  ansible.playbook = "ansible/setup.yml"
  ansible.verbose = "true" # same as `-v`
  ansible.become = "true" #sudo
end

###  Master node(s)
  (1..M).each do |i|
    config.vm.define "master-#{i}" do |master|
      master.vm.box = "#{IMAGE_NAME}"
      master.vm.network "private_network", ip: "192.168.56.#{10 + i}"
      master.vm.hostname = "master-#{i}"
      master.vm.network "forwarded_port", guest: 22, host: "#{65400 + i}"

      master.vm.provision "ansible_local" do |ansible|
        ansible.provisioning_path = "/vagrant"
        ansible.playbook = "ansible/master.yml"
        ansible.verbose = "true" # same as `-v`
        ansible.become = "true" #sudo
      end

      master.vm.provider "virtualbox" do |v| 
        v.memory = 4096
        v.cpus = 2
        v.name = "master-#{i}"
      end
    end
  end

###  Worker node(s)
  (1..N).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.box = "#{IMAGE_NAME}"
      node.vm.network "private_network", ip: "192.168.56.#{100 + i}"
      node.vm.hostname = "node-#{i}"
      node.vm.network "forwarded_port", guest: 22, host: "#{65500 + i}"

      node.vm.provision "ansible_local" do |ansible|
        ansible.provisioning_path = "/vagrant"
        ansible.playbook = "ansible/node.yml"
        ansible.verbose = "true" # same as `-v`
        ansible.become = "true" #sudo
      end
      
      node.vm.provider "virtualbox" do |v| 
        v.memory = 2048
        v.cpus = 1
        v.name = "node-#{i}"
      end
    end
  end
end




