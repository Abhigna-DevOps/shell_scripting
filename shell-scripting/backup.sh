
#!/bin/bash

display_usage() {
echo "usage: ./backup.sh <path to your source> <path to backup folder>"
}

if [[ $# -eq 0 ]]; then
display_usage
fi

source="$1"
timestamp="$(date +%Y-%m-%dT%H:%M:%S)"
dest="$2"

check_zip() {
if command -v zip &> /dev/null; then

	echo "zip is already installed" 
	exit 1
fi
}
backups (){
	sudo apt update
	sudo apt install zip -y


	zip -r "${dest}_backup/${timestamp}.zip" "${source}"
if [[ $? -eq 0 ]]; then
	echo "backup generated successfully for ${timestamp}"
fi
}
backups
