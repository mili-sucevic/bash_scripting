#!/bin/bash

# Export AWS Account ID
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)

# Create IAM User Groups
aws iam create-group --group-name eks-admins

# IAM Group Policy
ADMIN_GROUP_POLICY=$(echo -n '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAssumeOrganizationAccountRole",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": "arn:aws:iam::'; echo -n "$ACCOUNT_ID"; echo -n ':role/eks-admin-role"
    }
  ]
}')

# Create Policy
aws iam put-group-policy \
--group-name eks-admins \
--policy-name eks-admins-group-policy \
--policy-document "$ADMIN_GROUP_POLICY"
