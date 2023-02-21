#!/bin/bash

# Set environment variables for access key ID and secret access key
export AWS_ACCESS_KEY_ID=<your_access_key_id_here>
export AWS_SECRET_ACCESS_KEY=<your_secret_access_key_here>

# Configure AWS CLI profile
aws configure --profile eksadmin1 << EOF
us-east-1
json
EOF

# Set default profile
export AWS_DEFAULT_PROFILE=eksadmin1

# Get current user configured in AWS CLI
aws sts get-caller-identity

# Clean up kubeconfig
> $HOME/.kube/config

# Configure kubeconfig for kubectl
aws eks --region us-east-1 update-kubeconfig --name hr-dev-eksdemo1
