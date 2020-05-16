#!/usr/bin/env bash

set -e

# Variables
remote_host_name=$1

# Create key pair
ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/$remote_host_name -q -N ""
