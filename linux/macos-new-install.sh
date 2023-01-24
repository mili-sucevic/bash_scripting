#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Terraform
brew install terraform

# Install Ansible
brew install ansible

# Install Kubernetes
brew install kubectl

# Install Helm
brew install helm

# Install AWS CLI
brew install awscli

# Install Python 3
brew install python3

# Install kubie
brew install kubie

# Add kubectl aliases to bashrc file
echo "alias k=kubectl" >> ~/.bashrc
echo "alias kg='kubectl get'" >> ~/.bashrc
echo "alias kga='kubectl get all'" >> ~/.bashrc
echo "alias kgns='kubectl get ns'" >> ~/.bashrc
echo "alias kc='kubectl create'" >> ~/.bashrc
echo "alias kd='kubectl describe'" >> ~/.bashrc
echo "alias kdel='kubectl delete'" >> ~/.bashrc
echo "alias klogs='kubectl logs'" >> ~/.bashrc
echo "alias kf='kubectl apply -f'" >> ~/.bashrc
echo "alias kx='kubectl exec'" >> ~/.bashrc
echo "alias ktop='kubectl top'" >> ~/.bashrc
source ~/.bashrc
