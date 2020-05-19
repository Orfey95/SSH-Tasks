#!/usr/bin/env bash

set -e

# Variable
schedule_file=$1
workstation_ip=$(hostname -I | cut -d' ' -f2)

# Parsing schedule_file
expire_date=$(cat $schedule_file | sed -n '/\[Expire_date\]/,/\[IP_address\]/p' | tail -n +2 | head -n -1)
ip_address=$(cat $schedule_file | sed -n '/\[IP_address\]/,/\[Username\]/p' | tail -n +2 | head -n -1)
username=$(cat $schedule_file | sed -n '/\[Username\]/,/\[Limit_access\]/p' | tail -n +2 | head -n -1)
limit_access=$(cat $schedule_file | sed -n '/\[Limit_access\]/,//p' | tail -n +2)

echo "###############"
echo $expire_date
echo $ip_address
echo $username
echo $limit_access
echo "###############"

# Create ssh key pair
ssh $username@$ip_address 'bash -s' < create_key.sh

# Allow ssh from specific ip
ssh $username@$ip_address "bash -s $workstation_ip \"$(echo "$limit_access" | tr '\r\n' ' ')\"" < allow_ssh.sh
