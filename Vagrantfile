# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "tnarik/solaris10-minimal"
  config.vm.box_version = "0.0.1"
  config.vm.boot_timeout = 600
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   # vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  config.vm.provision "shell", inline: <<-SHELL
  # set xterm and bash as default in local profile
    cat <<EOF | tee .profile
TERM=xterm
export SHELL=/bin/bash
exec $SHELL
EOF

  # edit motd
    cat <<EOF | sudo tee /etc/motd
# BASIC COMMANDS:
whoami          - prints username
pwd             - prints current dir
ls -al          - lists directory
du -sh          - calculates dir size
pkgadd <pkg>    - installs package from local storage
pkgutil -i      - downloads and installs package
EOF

  # install vim with its' dependencies
    sudo pkgutil -i -y vim
  
  SHELL
end
