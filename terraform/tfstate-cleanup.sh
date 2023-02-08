#!/bin/bash

# Set the directory to search
dir_to_search=$1

# Find all terraform.tfstate files in the directory and its subdirectories and remove them
find $dir_to_search -name "terraform.tfstate*" -delete

# Remove .terraform directory
find . -name ".terraform" && find . -name ".terraform.lock.hcl" -exec rm -rf {} \;
