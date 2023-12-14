#!/bin/bash

#
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
#
kubectl create ns traefik
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install --namespace=traefik traefik traefik/traefik --values=rke2-lab/traefik-install/traefik/values.yaml
kubectl apply -f rke2-lab/traefik-install/traefik/default-headers.yaml
kubectl apply -f rke2-lab/traefik-install/traefik/dashboard/secret-dashboard.yaml
helm repo add jetstack https://charts.jetstack.io
helm repo update
kubectl create namespace cert-manager
kubectl get namespaces
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.2/cert-manager.crds.yaml
helm install cert-manager jetstack/cert-manager --namespace cert-manager --values=rke2-lab/traefik-install/cert-manager/values.yaml --version v1.13.2
kubectl apply -f rke2-lab/traefik-install/cert-manager/issuers/secret-cf-token.yaml
kubectl apply -f rke2-lab/traefik-install/cert-manager/issuers/letsencrypt-staging.yaml
kubectl apply -f rke2-lab/traefik-install/cert-manager/certificates/staging.yaml
kubectl apply -f rke2-lab/traefik-install/cert-manager/issuers/letsencrypt-prod.yaml
kubectl apply -f rke2-lab/traefik-install/cert-manager/certificates/prod.yaml