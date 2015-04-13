# This will get a nice ubuntu vm with gui running
# I still have things to do once installed, though, like get all the SSH keys into place.
# cp /vagrant/ssh/* ~/.ssh/
# chmod 600 ~/.ssh/*key
# mkdir gits
# cd gits/
# git clone git@bitbucket.org:chuyskywalker/jrm.cc.git
# cd jrm.cc/
# git config --global user.email "jeff@jrm.cc"
# git config --global user.name 'Jeff Minard'
# git config --global push.default simple

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu-official"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.memory = 4096
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
  config.vm.synced_folder "./", "/vagrant"
  config.vm.provision "shell", path: "install.sh"
end
