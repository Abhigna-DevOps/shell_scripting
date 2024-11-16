 #!/bin/bash

set -euo pipefail

check_awscli() {
if command -v aws &> /dev/null; then

	echo "awscli is already installed" >&2
	exit 1

fi

}


install_aws_cli() {

echo "downloading awscli"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install -y unzip &> /dev/null
unzip awscliv2.zip
sudo ./aws/install

aws --version

}


create_ec2() {

local ami_id  = $1
local instance_type = $2
local key_name = $3
local security_group = $4
local subnet_id = $5 

instanceid(aws ec2 run-instances \
    --image-id = $ami_id \
    --instance-type = $instance_type \
    --key-name = $key_name \
    --security-group-ids $security_group \
    --subnet-id $subnet_id \))

}

wait_for_running() {

local $instanceid = "$1"

while true; do 

state = $(aws ec2 describe-instances --instance-ids "$instanceid" --query 'Reservations[0].Instances[0].State.Name' --output text)

if [["$state" == "Running"]]; then

echo "instance "$instanceid" is in running state"

break

fi

sleep 10

done

}

parameters() {

"$ami_id" = 
"$instance_type" =
"$key_name" = 
"$security_group" =
"$subnet_id" =

}

check_awscli

install_aws_cli

create_ec2

wait_for_running
