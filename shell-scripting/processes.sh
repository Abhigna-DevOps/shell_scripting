#!/bin/bash

process_name="$1"

if [[ -z "$process_name" ]];then
	echo "please provide required arguments"
	exit 1
fi

pids=$(pgrep "$process_name")

if [[ -z "$pids" ]];then
	echo "no process found with this process name"
	exit 0
fi

echo "killing the process"
kill -9 "$pids"
echo "process killed"

