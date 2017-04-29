#!/bin/bash

# Check Vagrant latest version
latestver=`curl -s https://releases.hashicorp.com/vagrant/ | grep vagrant | awk -F "/" '{print $3}' | head -n 1`

if [[ $(uname) =~ "Darwin" ]] 
  then 
    wget https://releases.hashicorp.com/vagrant/$latestver/vagrant_$latestver.dmg
    sudo hdiutil attach ./vagrant_$latestver.dmg
    sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -target /    
    cd /tmp 
    flag=1 
    while [ $flag -ne 0 ]; do 
      sleep 1 
      set +e 
      hdiutil detach /Volumes/Vagrant/ 
      flag=$? 
      set -e 
    done 
    echo "#####################"
    echo "####### DONE ########"
    echo "#####################"
fi
