#!/bin/bash

# ssh.sh adds a ssh key to the `authorized_keys` file for your user on your server

read -p "Enter the name of the user on the server: " server_user

read -p "Enter the IP address of the server: " server_ip

read -p "Enter name of key: " key_name

key_path="$HOME/.ssh/$key_name"

# Generate a key and add it to ~/.ssh
ssh-keygen -t rsa -b 4096 -C "Generated key for $server_user@$server_ip" -f "$key_path"

# Add this key to the `authorized_keys` file for the specified user on the specified server
ssh-copy-id -i "$key_path.pub" -p 2222 "$server_user@$server_ip"

# Add this key to your identities on your machine
ssh-add "$key_path"