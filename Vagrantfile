# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos7"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
  end

  # provision with ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook          = "playbook.yml"
    ansible.sudo              = true
    ansible.host_key_checking = false
    # ansible.extra_vars        = { installapps: false }
  end
end
