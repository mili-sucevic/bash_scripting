#!/bin/bash

# Set the directory to search
dir_to_search=$1

# Find all terraform.tfstate files in the directory and its subdirectories and remove them
find $dir_to_search -name "terraform.tfstate*" -delete 2>/dev/null
find $dir_to_search -name "terraform.tfstate.backup" -delete 2>/dev/null

# Remove .terraform directory and its lock file
find $dir_to_search -name ".terraform" -type d -prune -exec rm -rf {} \; 2>/dev/null
find $dir_to_search -name ".terraform.lock.hcl" -delete 2>/dev/null
