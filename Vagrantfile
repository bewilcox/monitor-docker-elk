# -*- mode: ruby -*-
# vi: set ft=ruby :

# This VM will install all the needed compoenets to test a
# to monitor activity of a private Docker registry
Vagrant.configure(2) do |config|

  # VM Configuration
  ##################################

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname ="registry-docker-elk"

  config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
     vb.memory = "2048"
  end

  # Network configuration
  config.vm.network :private_network, ip:"192.168.29.100"


  # Provision
  #######################

  # Docker installation
  config.vm.provision :shell, :inline => "sudo apt-get install -y curl; curl -s http://get.docker.io/ubuntu/ | sudo sh"
  config.vm.provision :shell, :inline => 'sudo echo DOCKER_OPTS=\"--dns 8.8.8.8 --dns 8.8.4.4 --insecure-registry 192.168.29.100:5000\" >> /etc/default/docker'

  # Add vagrant to the docker user group
  config.vm.provision :shell, :inline => "sudo gpasswd -a vagrant docker"
  config.vm.provision :shell, :inline => "sudo service docker restart"

  # docker-compose installation
  config.vm.provision :shell, :inline => "curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
  config.vm.provision :shell, :inline => "chmod +x /usr/local/bin/docker-compose"
  config.vm.provision :shell, :inline => "curl -L https://raw.githubusercontent.com/docker/compose/1.1.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

end
