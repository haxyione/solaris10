# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "haxyione/solaris10"
  config.vm.box_version = "0.0.1"
  config.vm.boot_timeout = 600

  config.vm.provider "virtualbox" do |vb|
    host = RbConfig::CONFIG["host_os"]
    if host =~ /darwin/
      vb.memory = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 2
      vb.cpus = `sysctl -n hw.ncpu`.to_i
    elsif host =~ /linux/
      vb.memory = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/kb//'`.to_i / 1024 / 2
      vb.cpus = `nproc`.to_i
    elsif host =~ /windows/
      vb.memory = `wmic computersystem get TotalPhysicalMemory|findstr [0..9]`.to_i / 1024 / 1024 / 2
      vb.cpus = `wmic computersystem get NumberOfLogicalProcessors|findstr [0..9]`.to_i
    end
  end

  config.vm.provision "file", source: "./files/local.login", destination: "local.login"
  config.vm.provision "file", source: "./files/motd", destination: "/tmp/motd" 
  config.vm.provision "file", source: "./files/.profile", destination: "~"
  config.vm.provision "shell", inline: <<-SHELL
    sudo pkgutil -i -y vim
    sudo cp /tmp/motd /etc/motd
  SHELL
end
