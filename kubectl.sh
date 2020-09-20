#!/bin/bash
HOME=/home/vagrant
URL=https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl

echo "++ Instalacion de kubectl"
curl -LOs $URL
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "++ Hacer kubectl accesible para el usuario vagrant ++"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown vagrant:vagrant $HOME/.kube/config

echo "++ Activando el autocompletado para kubectl"
echo "source <(kubectl completion bash)" >> $HOME/.bashrc
source $HOME/.bashrc





