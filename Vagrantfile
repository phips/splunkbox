# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # search head
    config.vm.define "head", primary: true do |head|
        head.vm.box = "c65lvm"

        # provision with ansible
        head.vm.provision "ansible" do |ansible|
            ansible.playbook          = "playbook.yaml"
            ansible.sudo              = true
            ansible.host_key_checking = false
            ansible.extra_vars        = { installapps: false }
        end
    end
end
