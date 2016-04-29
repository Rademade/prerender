# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 4554, host: 4554
  config.vm.network :forwarded_port, guest: 22, host: 2223, host_ip: "0.0.0.0", id: "ssh", auto_correct: true

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.sudo = true
  end

  config.push.define "ftp" do |push|
    push.host = "vm.rademade.com"
    push.username = "prerender"
    push.destination = '~/prerender'
    push.secure = true
  end

end
