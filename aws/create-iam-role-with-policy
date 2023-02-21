#!/bin/bash

# Verify User (Ensure you are using AWS Admin)
aws sts get-caller-identity

# Export AWS Account ID
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
echo $ACCOUNT_ID

# IAM Trust Policy 
POLICY=$(echo -n '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"AWS":"arn:aws:iam::'; echo -n "$ACCOUNT_ID"; echo -n ':root"},"Action":"sts:AssumeRole","Condition":{}}]}')

# Verify both values
echo ACCOUNT_ID=$ACCOUNT_ID
echo POLICY=$POLICY

# Create IAM Role
ROLE_ARN=$(aws iam create-role \
  --role-name eks-admin-role \
  --description "Kubernetes administrator role (for AWS IAM Authenticator for Kubernetes)." \
  --assume-role-policy-document "$POLICY" \
  --output text \
  --query 'Role.Arn')

echo "Role created with ARN: $ROLE_ARN"

# Create IAM Policy - EKS Full access Permissions
aws iam create-policy \
  --policy-name eks-permissions-policy \
  --policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":["eks:*"],"Resource":"*"}]}' \
  --description "Permissions for Amazon EKS"

echo "IAM policy created: eks-permissions-policy"
