IMAGE_NAME = "generic/ubuntu2004"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
      
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "10.10.10.10"
        master.vm.network "public_network", :dev => "br0", :type =>"bridge"
        master.vm.hostname = "k8s-master"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbooks/master-playbook.yml"
            ansible.extra_vars = {
                node_ip: "10.10.10.10",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "10.10.10.#{i + 10}"
            node.vm.network "public_network", :dev => "br0", :type =>"bridge"
            node.vm.hostname = "node-#{i}"
            # node.vm.provision "ansible" do |ansible|
            #     ansible.playbook = "playbooks/node-playbook.yml"
            #     ansible.extra_vars = {
            #         node_ip: "10.10.10.#{i + 10}",
            #     }
            # end
        end
    end
end
