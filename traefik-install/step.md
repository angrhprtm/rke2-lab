create namespace
    kubectl create ns traefik
add helm repo
helm repo add traefik https://traefik.github.io/charts
    helm repo upddate
install traefik
 
helm install --namespace=traefik traefik traefik/traefik --values=values.yaml

helm install --namespace=traefik traefik traefik/traefik --values=traefik-install/traefik/values.yaml

kubectl apply -f traefik-install/traefik/default-headers.yaml

sudo apt-get update -y
sudo apt-get install apache2-utils -y







 
htpasswd -nb admin makanenak | openssl base64
YWRtaW46JGFwcjEkWWlFTHgubnQkWVFob0ZKallrSy9XNS43Z0tqU2ZELwoK
YWRtaW46JGFwcjEkbHd6aERMN0ckT1BvZUtxLkdvYXc4Ykd1VVd4MUtTLgoK
YWRtaW46JGFwcjEkNUVlWTZ1d2wkNDRpYVhGdENBMXp4MVo2YlpiNXJsMQoK


 kubectl apply -f traefik-install/traefik/dashboard/secret-dashboard.yaml

helm repo add jetstack https://charts.jetstack.io
helm repo update
kubectl create namespace cert-manager
kubectl get namespaces
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.2/cert-manager.crds.yaml
helm install cert-manager jetstack/cert-manager --namespace cert-manager --values=traefik-install/cert-manager/values.yaml --version v1.13.2


kubectl apply -f traefik-install/cert-manager/issuers/secret-cf-token.yaml
kubectl apply -f traefik-install/cert-manager/issuers/letsencrypt-staging.yaml







helm install cert-manager jetstack/cert-manager \
--namespace cert-manager \
--create-namespace \
--values=~/cert-manager/values.yaml \
--version v1.13.2
kubectl get pods --namespace cert-manager