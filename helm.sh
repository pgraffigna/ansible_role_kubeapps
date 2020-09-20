#!/bin/bash
URL=https://get.helm.sh/helm-v3.3.3-linux-amd64.tar.gz
TAR=helm-v3.3.3-linux-amd64.tar.gz

echo "++ Descarga de Helm ++"
curl -LOs $URL
tar -zxvf $TAR

echo "++  Agrega el ejecutable al PATH ++ "
sudo mv linux-amd64/helm /usr/local/bin/helm



