#!/bin/bash

# Set the IAM user name
USER_NAME="eks-admin-01"

# Create IAM user
aws iam create-user --user-name $USER_NAME

# Add IAM user to IAM group
aws iam add-user-to-group --group-name eks-admins --user-name $USER_NAME

# Set password for IAM user
aws iam create-login-profile --user-name $USER_NAME --password "@EKSAdmin01" --no-password-reset-required

# Create security credentials for IAM user and display them
aws iam create-access-key --user-name $USER_NAME
