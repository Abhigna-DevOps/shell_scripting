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

check_awscli

install_aws_cli


