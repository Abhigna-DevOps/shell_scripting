#!/bin/bash

set -euo pipefail

list() {
bucket_list=$(aws s3 ls)
}

input() {
read -p "Enter the bucket name: " input_bucket
if [["$bucket_list" | grep -qw "$input_bucket"]]; then
aws s3 sync s3://"$inputbucket" ./my-local-folder
else 
echo "bucket not found"
exit 1
fi
}

list
input
