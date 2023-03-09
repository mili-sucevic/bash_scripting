#!/bin/bash

# Set variables
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
EKS_ADMIN_ROLE="eks-admin-role"

# Verify aws-auth configmap before making changes
kubectl -n kube-system get configmap aws-auth -o yaml

# Edit aws-auth configmap
kubectl -n kube-system edit configmap aws-auth

# Wait for user input before proceeding
read -p "Please ensure you have updated the ConfigMap with the required IAM Role ARN. Press [Enter] to continue..."

# Replace the placeholder values with actual values
AWS_AUTH_CONFIG=$(cat <<EOF
apiVersion: v1
data:
  mapRoles: |
    - groups:
      - system:bootstrappers
      - system:nodes
      rolearn: arn:aws:iam::${ACCOUNT_ID}:role/devops-stag-eks-nodegroup-role
      username: system:node:{{EC2PrivateDNSName}}
    - groups:
      - system:masters
      rolearn: arn:aws:iam::${ACCOUNT_ID}:role/${EKS_ADMIN_ROLE}
      username: eks-admin
EOF
)

# Update the ConfigMap with the new IAM role ARN
echo "${AWS_AUTH_CONFIG}" | kubectl apply -f -

# Verify aws-auth configmap after making changes
kubectl -n kube-system get configmap aws-auth -o yaml
