#!/usr/bin/env bash

set -e

# Create key pair
ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/id_rsa_$(date --date='91 days' "+%Y_%m_%d") -q -N ""

# Add new ssh key
IdentityFile ~/.ssh/id_rsa_$(date "+%Y_%m_%d") | sudo tee -a ~/.ssh/config
