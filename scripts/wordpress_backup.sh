#!/bin/bash

backup_dir="/backup"

db_user="wordpressuser"
db_password="auditPass#00"
db_name="wordpress"

log_file="/var/log/backup.log"

touch $log_file

timestamp=$(date +"%Y_%m_%d")

backup_filename="wordpress_backup_$timestamp.tar.gz"

backup_command="mysqldump -u$db_user -p$db_password $db_name | gzip > $backup_dir/$backup_filename"

# Perform the backup
eval ${backup_command}

# Check if the backup was successful
if [ $? -eq 0 ]; then
   echo "$(date +"%Y-%m-%d %H:%M:%S") - WordPress database backup successful" >> $log_file
else
   echo "$(date +"%Y-%m-%d %H:%M:%S") - WordPress database backup failed" >> $log_file
fi