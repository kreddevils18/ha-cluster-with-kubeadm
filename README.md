# Setup Kubernetes cluster with kubeadm
## Prerequisites
Before you want to try this on your local, here are requirements
- vagrant
```
brew install --cask vagrant
```
- install Parallels

## Provision VMs with Parallels
```
vagrant up
```
## Setup kubernetes cluster
```
vagrant ssh ansible
cd /vagrant && make cluster
```
## Download kubeconfig to your local
```
mkdir -p ~/.kube-local
scp vagrant@master1:/home/vagrant/.kube/config ~/.kube-local/config
export KUBECONFIG=$HOME/.kube-local/config
```
