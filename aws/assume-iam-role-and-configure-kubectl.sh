#!/bin/bash

# Export AWS Account ID
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
echo "AWS Account ID: $ACCOUNT_ID"

# Assume IAM Role
ROLE_NAME="eks-admin-role"
ROLE_SESSION_NAME="eks-adminsession-01"
echo "Assuming IAM role $ROLE_NAME with session name $ROLE_SESSION_NAME..."
ROLE=$(aws sts assume-role --role-arn "arn:aws:iam::$ACCOUNT_ID:role/$ROLE_NAME" --role-session-name $ROLE_SESSION_NAME)

# GET Role Values and replace here
AWS_ACCESS_KEY_ID=$(echo $ROLE | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo $ROLE | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo $ROLE | jq -r '.Credentials.SessionToken')

# Export role credentials
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

echo "AWS access key ID: $AWS_ACCESS_KEY_ID"
echo "AWS secret access key: $AWS_SECRET_ACCESS_KEY"
echo "AWS session token: $AWS_SESSION_TOKEN"

# Verify current user configured in aws cli
aws sts get-caller-identity

# Clean-Up kubeconfig
echo "Cleaning up kubeconfig..."
>$HOME/.kube/config
cat $HOME/.kube/config

# Configure kubeconfig for kubectl
echo "Configuring kubeconfig for kubectl..."
aws eks --region us-east-1 update-kubeconfig --name devops-stag-eks-demo

# Describe Cluster
echo "Describing cluster devops-stag-eks-demo..."
aws eks --region us-east-1 describe-cluster --name devops-stag-eks-demo --query cluster.status

# List Kubernetes Nodes
echo "Listing Kubernetes nodes and pods..."
kubectl get nodes
kubectl get pods -n kube-system

# Unset environment variables
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
echo "Environment variables unset."

# Verify current user configured in aws cli
aws sts get-caller-identity
