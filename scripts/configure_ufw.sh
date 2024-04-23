#!/bin/bash

sudo ufw enable

# Disable ipv6 in the ufw rules
sudo sed -i 's/IPV6=YES/IPV6=NO/' /etc/default/ufw

# FTP
sudo ufw allow 20, 21/tcp

# SSH
sudo ufw allow 2222/tcp

# HTTP
sudo ufw allow 80/tcp

# HTTPS
sudo ufw allow 443/tcp