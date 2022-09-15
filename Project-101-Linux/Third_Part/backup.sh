#!/bin/bash


# Check if we are root privilage or not
if [[ $UID -ne 0 ]]
then
    echo "Please enter as a root"
    exit 1
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file

backup_files="/home/ilgea/data /etc /boot /opt"

# Where do we backup to. Please crete this file before execute this script

dest="/mnt/backup"

# Create archive filename based on time
day=$(date +%Y_%d_%m-%H:%M)
hostname=$(hostname -s)  # birden fazla server olduğu için karıştırmamak amacıyla bunu ekliyoruz.
archive_files="$hostname-$day.tgz"

# Print start status message.

echo "Backup started"


# Backup the files using tar.

tar -cvzf ${dest}/${archive_files} ${backup_files}  # Şunun altına şunu koy. Sıra böyle.$dest/$archive_files altına $backup_files koy.

# Print end status message.

echo "Backup complete"

# Long listing of files in $dest to check file sizes.

ls -lh $dest

# To set this script for executing in every 5 minutes, we'll create cronjob

