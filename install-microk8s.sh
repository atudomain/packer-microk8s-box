#
# Configure microk8s on ubuntu 
#

# Fail on error and print commands
set -ex

# Install microk8s
sudo apt-get update
sudo snap install microk8s --classic

# Configure user access
sudo usermod -a -G microk8s vagrant

# Create aliases
echo 'alias kubectl="microk8s.kubectl"' >> ~/.bashrc
echo 'alias helm="microk8s.helm3"' >> ~/.bashrc

# Enable basic addons
sudo microk8s enable dns
sudo microk8s enable ingress
sudo microk8s enable storage
sudo microk8s enable helm3

# Wait for all deployments ready
while sudo microk8s.kubectl get deployment --all-namespaces | grep '0/'
do
    sleep 10
done
