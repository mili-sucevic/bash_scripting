#!/bin/bash

# Create IAM User
aws iam create-user --user-name eksadmin1

# Attach AdministratorAccess Policy to User
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --user-name eks-admin-01

# Set password for eksadmin1 user
aws iam create-login-profile --user-name eks-admin-01 --password @EK5U53r01234567 --no-password-reset-required

# Create Security Credentials for IAM User and make a note of them
aws iam create-access-key --user-name eks-admin-01
