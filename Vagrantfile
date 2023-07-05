# -*- mode: ruby -*-
# vi: set ft=ruby :
IMAGE_NAME = "bento/ubuntu-20.04-arm64"

ANSIBLE_MEMORY = 512
ANSIBLE_CPUS = 1

LOADBALANCER_NUMS = 2
LOADBALANCER_MEMORY = 512
LOADBALANCER_CPUS = 1

MASTER_NUMS = 1
MASTER_MEMORY = 2048
MASTER_CPUS = 2

WORKER_NUMS = 2
WORKER_MEMORY = 1024
WORKER_CPUS = 2

Vagrant.configure("2") do | config |
  config.ssh.insert_key = false
  config.vm.box = IMAGE_NAME
  config.vm.synced_folder "." "/vagrant", disabled: true

  # ansible host
  config.vm.define "ansible" do |node|
    node.vm.hostname = "ansible"
    node.vm.network "private_network", ip: "192.168.1.11"
    node.vm.provider "parallels" do |v|
      v.name = "ansible"
      v.memory = ANSIBLE_MEMORY
      v.cpus = ANSIBLE_CPUS
    end
    node.vm.provision "shell" do |shell|
      shell.path = "./scripts/ansible.sh"
    end
  end

  # load balancer
  # (1..LOADBALANCER_NUMS).each do |i|
  #   config.vm.define "loadbalancer#{i}" do |node|
  #     node.vm.hostname = "loadbalancer#{i}"
  #     node.vm.network "private_network", ip: "192.168.2.1#{i}"
  #     node.vm.provider "parallels" do |v|
  #       v.name = "loadbalancer#{i}"
  #       v.memory = LOADBALANCER_MEMORY
  #       v.cpus = LOADBALANCER_CPUS
  #     end
  #   end
  # end

  # master nodes
  (1..MASTER_NUMS).each do |i|
    config.vm.define "master#{i}" do |node|
      node.vm.hostname = "master#{i}"
      node.vm.network "private_network", ip: "192.168.3.1#{i}"
      node.vm.provider "parallels" do |v|
        v.name = "master#{i}"
        v.memory = MASTER_MEMORY
        v.cpus = MASTER_CPUS
      end
    end
  end

  # worker nodes
  (1..WORKER_NUMS).each do |i|
    config.vm.define "worker#{i}" do |node|
      node.vm.hostname = "worker#{i}"
      node.vm.network "private_network", ip: "192.168.4.1#{i}"
      node.vm.provider "parallels" do |v|
        v.name = "worker#{i}"
        v.memory = WORKER_MEMORY
        v.cpus = WORKER_CPUS
      end
    end
  end
end
