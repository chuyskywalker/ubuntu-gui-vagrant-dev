#!/bin/bash

echo '--- Installing Desktop, VBox items, JDK'
apt-get install -y ubuntu-desktop virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 openjdk-7-jdk

echo '--- Install latest docker'
wget -qO- https://get.docker.com/ | sh
usermod -aG docker vagrant

echo '--- Installing vbox clipboard'
VBoxClient --clipboard

# Not really sure I need this...
echo '--- Setting up vagrant as x11able'
sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config

echo '--- Installing phpstorm'
wget -q https://download.jetbrains.com/webide/PhpStorm-8.0.3.tar.gz
tar xf PhpStorm-8.0.3.tar.gz
rm -f PhpStorm-8.0.3.tar.gz
chown -R vagrant.vagrant PhpStorm*
# todo: it'd be really nice to be able to install the license automatically, alas...
# todo: copy in my configuration

echo '--- Enable Auto-Login'
mkdir -p /etc/lightdm/lightdm.conf.d
echo "[SeatDefaults]
allow-guest=false
autologin-user=vagrant
" > /etc/lightdm/lightdm.conf.d/50-myconfig.conf

echo '--- Disable Screen Saver'
sudo -u vagrant dconf write /org/gnome/desktop/screensaver/idle-activation-enabled false
sudo -u vagrant dconf write /org/gnome/desktop/screensaver/lock-enabled false

echo '--- Install ssh keys'
cp /vagrant/ssh/*key /home/vagrant/.ssh/
cp /vagrant/ssh/*pub /home/vagrant/.ssh/
cp /vagrant/ssh/config /home/vagrant/.ssh/
chmod 600 ~/.ssh/*key
chmod -R vagrant.vagrant ~/.ssh

echo '--- Clone Git Repos In'
mkdir /home/vagrant/gits
chown vagrant.vagrant /home/vagrant/gits
cd    /home/vagrant/gits
sudo -u vagrant git clone git@bitbucket.org:chuyskywalker/jrm.cc.git
sudo -u vagrant git clone git@github.com:chuyskywalker/poop-chart.git
sudo -u vagrant git config --global user.email "jeff@jrm.cc"
sudo -u vagrant git config --global user.name 'Jeff Minard'
sudo -u vagrant git config --global push.default simple

echo "Oddly, one must reboot now..."
reboot now
