IMAGE_NAME = "generic/ubuntu2004"
N = 1

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
    end
      
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.56.50"
        master.vm.network "public_network", :dev => "br0", :type =>"bridge"
        master.vm.hostname = "k8s-master"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbooks/master-playbook.yml"
            ansible.extra_vars = {
                node_ip: "192.168.56.50",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.56.#{i + 50}"
            node.vm.network "public_network", :dev => "br0", :type =>"bridge"
            node.vm.hostname = "node-#{i}"
            # node.vm.provision "ansible" do |ansible|
            #     ansible.playbook = "playbooks/node-playbook.yml"
            #     ansible.extra_vars = {
            #         node_ip: "192.168.56.#{i + 50}",
            #     }
            # end
        end
    end
end
