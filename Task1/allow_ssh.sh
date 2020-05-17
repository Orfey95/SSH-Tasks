#!/usr/bin/env bash

set -e

# Variables
workstation_ip=$1
allow_ip=$2

# Deny ssh for all
if ! grep -q "sshd : ALL" /etc/hosts.deny; then 
	echo "sshd : ALL" | sudo tee -a /etc/hosts.deny 
fi

# Allow ssh for Workstation
if ! grep -q "sshd : $workstation_ip" /etc/hosts.allow; then 
	echo "### Workstation ###" | sudo tee -a /etc/hosts.allow 
	echo "sshd : $workstation_ip" | sudo tee -a /etc/hosts.allow 
	echo "###################" | sudo tee -a /etc/hosts.allow 
fi

# Allow ssh for specific ip
if ! grep -q "sshd : $allow_ip" /etc/hosts.allow; then 
	echo "sshd : $allow_ip" | sudo tee -a /etc/hosts.allow 
fi
