#!/bin/bash

# Backup the sshd_config file
sudo cp /etc/ssh/sshd_config /backup/sshd_config.bak

# Change the port to 2222
sudo sed -i 's/^Port .*/Port 2222/' /etc/ssh/sshd_config

# Disable root login
sudo sed -i 's/^PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config

# Enable public key authentication
sudo sed -i 's/^PubkeyAuthentication .*/PubkeyAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart sshd
