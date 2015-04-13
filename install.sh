#!/bin/bash

echo 'Installing Desktop, VBox items, JDK, and docker'
apt-get install -y ubuntu-desktop virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 openjdk-7-jdk docker.io

echo 'Installing vbox clipboard'
VBoxClient --clipboard

echo 'Setting up vagrant as x11'
sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config

echo 'Installing phpstorm'
wget -q https://download.jetbrains.com/webide/PhpStorm-8.0.3.tar.gz
tar xf PhpStorm-8.0.3.tar.gz
rm -f PhpStorm-8.0.3.tar.gz
chown -R vagrant.vagrant PhpStorm*

echo 'Auto-Login Setup'
mkdir -p /etc/lightdm/lightdm.conf.d
echo "[SeatDefaults]
allow-guest=false
autologin-user=vagrant
" > /etc/lightdm/lightdm.conf.d/50-myconfig.conf

echo "Oddly, one must reboot now..."
reboot now
