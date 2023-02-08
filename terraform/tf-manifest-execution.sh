#!/bin/bash

# Define the main folder that contains the top-level Terraform manifest
main_folder=$1

# Define the subfolders containing Terraform manifests
subfolder_1=$2
subfolder_2=$3
subfolder_3=$4

# Format the main folder
terraform fmt -recursive $main_folder

# Validate the main folder
terraform validate $main_folder

# Initialize the main folder
terraform init $main_folder

# Apply the changes in the main folder
terraform apply -auto-approve $main_folder

# Wait until the changes are completed
terraform apply --wait=60s $main_folder

# Repeat the process for subfolder 1
terraform fmt -recursive $subfolder_1
terraform validate $subfolder_1
terraform init $subfolder_1
terraform apply -auto-approve $subfolder_1
terraform apply --wait=900s $subfolder_1

# Repeat the process for subfolder 2
terraform fmt -recursive $subfolder_2
terraform validate $subfolder_2
terraform init $subfolder_2
terraform apply -auto-approve $subfolder_2
terraform apply --wait=60s $subfolder_2

# # Repeat the process for subfolder 3
# terraform fmt -recursive $subfolder_3
# terraform validate $subfolder_3
# terraform init $subfolder_3
# terraform apply -auto-approve $subfolder_3
# terraform apply --wait=60s $subfolder_3
