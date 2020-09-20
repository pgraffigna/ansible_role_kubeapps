#!/bin/bash
REPO=https://charts.bitnami.com/bitnami

echo "++ Instalar Kubeapps ++" 
helm repo add bitnami $REPO
kubectl create namespace kubeapps
helm install kubeapps --namespace kubeapps bitnami/kubeapps --set useHelm3=true

echo "++ Creacion del API TOKEN para acceder al Dashboard de Kubeapps ++"
kubectl create serviceaccount kubeapps-operator
kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator

echo "++ Mostrar el TOKEN ++"
kubectl get secret $(kubectl get serviceaccount kubeapps-operator -o jsonpath='{range .secrets[*]}{.name}{"\n"}{end}' | grep kubeapps-operator-token) -o jsonpath='{.data.token}' -o go-template='{{.data.token | base64decode}}' && echo

echo "++ Iniciar el Dashboard ++"
export POD_NAME=$(kubectl get pods -n kubeapps -l "app=kubeapps,release=kubeapps" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward -n kubeapps $POD_NAME 8080:8080

#while [[ $(kubectl -n kubeapps get $POD_NAME -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 20s; done

