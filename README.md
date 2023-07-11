Install VirtualBox and Vagrant


Create a new Vagrantfile:
```sh
vagrant init hashicorp/bionic64
```

Start the VM:
```sh
vagrant up
```

Log in to it:
```sh
vagrant ssh
```

Initialize the Kubernetes cluster:
```sh
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```

copy the kubeconfig file:
```sh
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Install the Calico network plugin:
```sh
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

Verify that the Kubernetes cluster is up:
```sh
kubectl get nodes
```