# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.network :private_network, ip: "192.168.50.4"
  config.vm.network :forwarded_port,  guest: 9200, host: 9200

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpuexecutioncap = 100
  end

  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  config.omnibus.chef_version = "11.10.0"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.add_role("elasticsearch")
  end

  config.vm.provision :serverspec do |spec|
    spec.pattern = "*_spec.rb"
  end
end
