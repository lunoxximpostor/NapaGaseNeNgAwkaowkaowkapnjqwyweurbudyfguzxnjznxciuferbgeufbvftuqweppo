#!/bin/bash

# Install kernel xanmod 
echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/xanmod-kernel.gpg add -
sudo apt update && sudo apt install linux-xanmod

echo " [  INFO  ] sistem kernel telah dimodifikasi"
echo " [  INFO  ] segera reboot"