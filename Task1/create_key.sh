#!/usr/bin/env bash

set -e

# Create key pair
ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/id_rsa -q -N ""
