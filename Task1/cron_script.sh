#!/usr/bin/env bash

set -e

# Get expiring keys (tomorrow)
files_string_for_new_keys=$(echo $(find schedules/* -type f -exec grep -l $(date --date='tomorrow' "+%Y_%m_%d") {} \;))

# Run ssh_distributor.sh for each host
IFS=' ' read -a files_array_for_new_keys <<< "$files_string_for_new_keys"
for schedule_file in "${files_array_for_new_keys[@]}"; do
	bash ssh_distributor.sh $schedule_file false
done

# Get expired keys (yesterday)
files_string_for_delete_keys=$(echo $(find schedules/* -type f -exec grep -l $(date --date='yesterday' "+%Y_%m_%d") {} \;))

# Run ssh_distributor.sh for each host
IFS=' ' read -a files_array_for_delete_keys <<< "$files_string_for_delete_keys"
for schedule_file in "${files_array_for_delete_keys[@]}"; do
	bash ssh_distributor.sh $schedule_file true
done
