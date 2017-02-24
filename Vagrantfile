# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "tnarik/solaris10-minimal"
  config.vm.box_version = "0.0.1"
  config.vm.boot_timeout = 600

  config.vm.provision "file", source: "./files/local.login", destination: "local.login"
  config.vm.provision "file", source: "./files/motd", destination: "/tmp/motd" 

  config.vm.provision "shell", inline: <<-SHELL
    sudo pkgutil -i -y vim
    sudo cp /tmp/motd /etc/motd
  SHELL
end
