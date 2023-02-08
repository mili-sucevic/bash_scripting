#!/bin/bash

# Set the directory to search
dir_to_search=$1

# Find all terraform.tfstate files in the directory and its subdirectories and remove them
find $dir_to_search -name "terraform.tfstate*" -or -name "terraform.tfstate.backup" -delete

# Remove .terraform directory and its lock file
find $dir_to_search -name ".terraform" -or -name ".terraform.lock.hcl" -exec rm -rf {} \;
