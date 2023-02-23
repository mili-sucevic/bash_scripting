#!/bin/bash

# Disable root login
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Set up password policy
sudo apt-get install -y libpam-pwquality
sudo sed -i 's/^password.*pam_unix.so.*/password    requisite  pam_pwquality.so retry=3 minlen=10 minclass=3/' /etc/pam.d/common-password

# Enable firewall
sudo apt-get install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# Disable unused services
sudo systemctl disable bluetooth.service
sudo systemctl disable cups.service
sudo systemctl disable cups-browsed.service

# Set up automatic security updates
sudo apt-get install -y unattended-upgrades
sudo sed -i 's/^\/\/\s\{0,\}"\${distro_id}:\${distro_codename}-updates";/        "\${distro_id}:\${distro_codename}-updates";/' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/^\/\/Unattended-Upgrade::Automatic-Reboot.*/Unattended-Upgrade::Automatic-Reboot "true";/' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/^\/\/Unattended-Upgrade::Automatic-Reboot-Time.*/Unattended-Upgrade::Automatic-Reboot-Time "04:00";/' /etc/apt/apt.conf.d/50unattended-upgrades

# Disable guest account
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /etc/lightdm/lightdm.conf.d/50-no-guest.conf'

# Disable IPv6
sudo sh -c 'echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf'
sudo sh -c 'echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf'
sudo sh -c 'echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf'
sudo sysctl -p

# Remove unnecessary packages
sudo apt-get purge -y snapd gnome-software

# Update and upgrade packages
sudo apt-get update
sudo apt-get upgrade -y

# Reboot the system
sudo reboot
