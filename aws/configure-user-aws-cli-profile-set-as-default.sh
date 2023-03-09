#!/bin/bash

# Set AWS access key ID and secret access key as environment variables
export AWS_ACCESS_KEY_ID=AKIA2OB4ZYCL2R6CX3UW
export AWS_SECRET_ACCESS_KEY=fiWykBA4hHzE8TM/NvFDR3mrbsfLlIomfuXu/L9O

# List all configuration data
aws configure list

# List all your profile names
aws configure list-profiles

# Configure aws cli eks-admin-01 Profile 
aws configure --profile eks-admin-01 << EOF
us-east-1
json
EOF

# Get current user configured in AWS CLI
aws sts get-caller-identity
# Should see the default user (EKS_Cluster_Create_User) from default profile

# Set default profile
export AWS_DEFAULT_PROFILE=eks-admin-01

# Get current user configured in AWS CLI
aws sts get-caller-identity
# Should show the user "eks-admin-01" from eks-admin-01 profile, refer below sample output

# Clean up kubeconfig
> $HOME/.kube/config
cat $HOME/.kube/config

# Configure kubeconfig for kubectl
aws eks --region us-east-1 update-kubeconfig --name devops-stag-eks-demo
# Should fail
