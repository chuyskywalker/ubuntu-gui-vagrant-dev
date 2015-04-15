# This will get a nice ubuntu vm with gui running -- the "install.sh" is the real magic
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu-official"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.memory = 4096
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--vram", "128"]
	# todo: figure out how to turn on 2d/3d video acceleration
  end
  config.vm.synced_folder "./", "/vagrant"
  config.vm.provision "shell", path: "install.sh"
end
