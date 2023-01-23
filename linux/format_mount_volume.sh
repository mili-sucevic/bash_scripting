#!/bin/bash

# Set the device name of the volume
volume_device=nvme1n1

# Set the mount point directory
mount_point=/mnt/data

# Create the mount point directory
mkdir $mount_point

# Format the volume as ext4 file system
mkfs.ext4 /dev/$volume_device

# Mount the volume to the mount point directory
mount /dev/$volume_device $mount_point

# Verify that the volume is mounted
df -h
