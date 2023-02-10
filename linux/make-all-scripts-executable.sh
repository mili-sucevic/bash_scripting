#!/bin/bash

folder=$1

for file in "$folder"/*.py; do
  chmod +x "$file"
done
