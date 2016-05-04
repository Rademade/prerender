# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.sudo = true
  end

  config.vm.network :forwarded_port, guest: 4554, host: 4554
  config.vm.network :forwarded_port, guest: 22, host: 2223, host_ip: "0.0.0.0", id: "ssh", auto_correct: true

  config.vm.define :testing, primary: true do |test|
    test.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end
  end

  config.vm.define :production do |production|
    production.vm.provider "libvirt" do |libvirt|
      libvirt.memory = 4096
      libvirt.cpus = 2
    end
    production.vm.provider :managed do |managed, override|
      managed.server = "vm.rademade.com"
      override.ssh.username = "prerender"
    end
  end



end
