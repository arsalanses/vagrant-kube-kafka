Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  # config.vm.provision "ansible" do |ansible|
  #   ansible.playbook = "./playbooks/kubernetes.yml"
  # end

end
