#!/usr/bin/env bash

set -e

# Variables
allow_ip=$1

# Deny ssh for all
if ! grep -q "sshd : ALL" /etc/hosts.allow; then 
	echo "sshd : ALL" | sudo tee -a /etc/hosts.deny 
fi

# Allow ssh for specific ip
if ! grep -q "sshd : $allow_user" /etc/hosts.allow; then 
	echo "sshd : $allow_ip" | sudo tee -a /etc/hosts.allow 
fi
