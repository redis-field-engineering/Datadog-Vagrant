# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Bootstrap for Ansible
  config.vm.provision "shell",
    inline: "DEBIAN_FRONTEND=noninteractive sudo apt-get -y install python"

  config.vm.box         = "ubuntu/disco64"
  config.vm.hostname    = "base-ami"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook       = "ansible/playbook.yml"
    ansible.sudo           = "true"
  end


end
