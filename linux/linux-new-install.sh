#!/bin/bash

# Update package index
sudo apt-get update
sudo apt-get install -y zsh

# Install Terraform
sudo apt-get install -y terraform

# Add Terraform to PATH
echo 'export PATH="$PATH:/usr/local/bin/terraform"' >> ~/.zshrc
source ~/.zshrc

# Install Ansible
sudo apt-get install -y ansible

# Add Ansible to PATH
echo 'export PATH="$PATH:/usr/bin/ansible"' >> ~/.zshrc
source ~/.zshrc

# Install Kubernetes
sudo apt-get install -y kubectl

# Add Kubernetes to PATH
echo 'export PATH="$PATH:/usr/local/bin/kubectl"' >> ~/.zshrc
source ~/.zshrc

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Add Helm to PATH
echo 'export PATH="$PATH:/usr/local/bin/helm"' >> ~/.zshrc
source ~/.zshrc

# Install AWS CLI
sudo apt-get install -y awscli

# Add AWS CLI to PATH
echo 'export PATH="$PATH:/usr/local/bin/aws"' >> ~/.zshrc
source ~/.zshrc

# Install Python 3
sudo apt-get install -y python3

# Install kubie
curl https://get.kubie.sh | bash

# Add kubie to PATH
echo 'export PATH="$PATH:~/.kubie"' >> ~/.zshrc
source ~/.zshrc

# Add kubectl aliases to zshrc file
## Generate a secure password and copy it to clipboard
alias genpw='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy'

## generic
alias reload!=". ~/.zshrc"
alias ll="ls -lah"
alias vissh="vi ~/.ssh/config"
alias vihost="sudo vi /etc/hosts"
alias vizsh="vi ~/.zshrc"

## Kubernetes
alias k="kubectl"
alias kg="k get"
alias kgp="k get pods -o wide"
alias kgn="k get nodes -o wide"
alias kgs="k get service"
alias kgpv="k get pv"
alias kgpvc="k get pvc"
alias kd="k describe"
alias kns="kubie ns"
alias kcx="kubie ctx"
alias pod-check="kgp -A -o wide | grep -v Running | grep -v Comp"
alias pod-count="kgp -A | wc -l"

## SSL
alias certexp="openssl x509 -enddate -noout -in"
alias certcheck="openssl x509 -noout -text -in"
alias caverify="openssl verify -CAfile"

## Networking
alias mtr="sudo /usr/local/sbin/mtr"
alias nlp="nslookup"

## Git
alias gcm="git commit -m"
alias gp="git push"
alias gpt="git push --tags"

## Ansible
alias ansible="/usr/local/opt/ansible@2.8/bin/ansible"
alias ansible-playbook="/usr/local/opt/ansible@2.8/bin/ansible-playbook"
alias ansible2="/usr/local/opt/ansible@2.9/bin/ansible"
alias ansible2-playbook="/usr/local/opt/ansible@2.9/bin/ansible-playbook"
alias ansible4="/usr/local/opt/ansible/bin/ansible"
alias ansible4-galaxy="/usr/local/opt/ansible/bin/ansible-galaxy"
alias ansible4-playbook="/usr/local/opt/ansible/bin/ansible-playbook"

## Helm
alias helm="/usr/local/opt/helm/bin/helm"

## Zsh Auto Complete
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

source ~/.zshrc
