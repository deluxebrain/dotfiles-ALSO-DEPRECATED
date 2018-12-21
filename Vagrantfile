# -*- mode: ruby -*-
# vi: set ft=ruby :

# Bootstrapping of guest machine
$bootstrap_guest = <<-SCRIPT
# Ensure that the upgrade is performed non-interactively
# https://github.com/chef/bento/issues/661
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  upgrade
sudo timedatectl set-timezone "Europe/London"
# Uncomment to install desktop
# sudo apt-get -y install ubuntu-desktop
SCRIPT

# Run in dotfiles
user_name=`git config user.name`.strip
user_email=`git config user.email`.strip
$install_dotfiles = <<-SCRIPT
cd /vagrant
./install -ptrue -o backup \
    -v user.name=#{user_name},user.email=#{user_email}
SCRIPT

Vagrant.configure("2") do |config|

    # Guest settings
    config.vm.box = "ubuntu/bionic64"
    config.vm.hostname = "dotfiles"

    # SSH configuration
    config.ssh.forward_agent = true
    config.ssh.insert_key = true

    # Bootstrap the guest ( as root )
    config.vm.provision "shell",
        inline: $bootstrap_guest,
        privileged: true

    # Run in dotfiles ( as vagrant user )
    config.vm.provision "shell",
        inline: $install_dotfiles,
        privileged: false

    # Hypervisor configuration
    config.vm.provider "virtualbox" do |vbox, override|
        vbox.name = config.vm.hostname   # vbox ui title
        vbox.gui = false
        vbox.memory = 4096
        vbox.cpus = 2
    end
    if Vagrant.has_plugin?("vagrant-vbguest")
        config.vbguest.auto_update = true
        config.vbguest.no_remote = false
    end
end
