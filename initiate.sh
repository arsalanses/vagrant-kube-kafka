#!/bin/bash 

vagrant destroy -f 
vagrant up

vagrant provision

vagrant ssh k8s-master -- -t 'kubectl get nodes && kubectl get pods -n kube-system'

# vagrant ssh k8s-master
