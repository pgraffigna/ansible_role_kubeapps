#!/bin/bash
GPG=https://download.docker.com/linux/ubuntu/gpg
URL=https://download.docker.com/linux/ubuntu


echo "++ Actualiza la cache de los repos ++"
sudo apt-get update -qq

echo "++ Instalación de dependencias ++"
sudo apt-get install -y -qq apt-transport-https ca-certificates curl gnupg-agent  software-properties-common

echo "++ Agrega la llave GPG de Docker ++"
curl -fsSL  $GPG | sudo apt-key add -

echo "++ Agrega el repositorio stable ++"
sudo add-apt-repository \
   "deb [arch=amd64] $URL \
   $(lsb_release -cs) \
   stable"

echo "++ Actualiza la cache de los repos ++"
sudo apt-get update -qq

echo "++ Instala Docker-ce ++" 
sudo apt-get install -y -qq docker-ce

echo "++ Agrega el usuario vagrant al grupo docker ++"
sudo usermod -aG docker $USER