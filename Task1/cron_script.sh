#!/usr/bin/env bash

set -e

# Get expiring keys
files_string=$(echo $(find schedules/* -type f -exec grep -l $(date --date='90 days' "+%Y_%m_%d") {} \;))

# Run ssh_distributor.sh for each host
IFS=' ' read -a files_array <<< "$files_string"
for i in "${files_array[@]}"; do
        bash ssh_distributor.sh $i
done
