#!/bin/bash
URL=https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

echo "++ Instalacion de dependencias"
sudo apt-get install -y -qq conntrack

echo "++ Descarga de minikube ++"
curl -Lso minikube  $URL && chmod +x minikube

echo "++ Agrega el ejecutable al PATH ++"
sudo mv minikube /usr/local/bin/ 

echo "++ Inicia el cluster ++"
sudo minikube start --vm-driver=none 2>/dev/null 

