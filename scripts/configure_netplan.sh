#!/bin/bash

# Prompt for the default gateway
read -p "Enter the default gateway: " gateway

# Extract the subnet from the gateway and create the address
subnet=$(echo $gateway | cut -d'.' -f1-3)
address="${subnet}.100/24"

# Create the netplan configuration
cat <<EOF | sudo tee /etc/netplan/00-installer-config.yaml > /dev/null
network:
  ethernets:
    enp0s1:
      dhcp4: false
      dhcp6: false
      accept-ra: no
      addresses: [$address]
      routes:
      - to: default
        via: $gateway
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]
  version: 2
EOF

# Apply the netplan configuration
sudo netplan apply
