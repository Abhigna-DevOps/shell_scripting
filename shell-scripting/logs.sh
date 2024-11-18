#!/bin/bash

LOG_DIR="/var/log/app_name"
BACKUP_DIR="/backup/logs"
DATE=$(date + "%Y-%m-%d")
LOG_File="/var/log/backup_script.log"

if [[ ! -d "$BACKUP_DIR" ]];then

	echo "BACKUP_DIR does not exists. creating.. $BACKUP_DIR" >> "$LOG_File"
	mkdir -p "$BACKUP_DIR"
fi

backup_process(){

find "$LOG_DIR" type -f -mtime +7 -name "*log*" | while read -r file; do
gzip "$file"
mv "$file.gz" "$BACKUP_DIR"
"$BACKUP_DIR" >> "$LOG_FILE"

}

echo "[$(date)] Backup process completed successfully." >> "$LOG_FILE"

# Set proper permissions for backup files
chmod -R 600 "$BACKUP_DIR"/*

# Exit with status
exit 0
