#!/bin/bash
#

# This script creates a new user on the local system.

# You will be prompted to enter the username (login), the person name, and a password.

# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
if [[ $UID -ne 0 ]]
then
    echo "Please login as root user."
    exit 1
fi

# Get the username (login).
read -p "Pleas enter username: " username

# Get the real name (contents for the description field).
read -p "Please enter a real name or department name: " name
# Get the password.

read -sp "Please enter a password: " password
# Create the account.

useradd -m -c $name $username
# Check to see if the useradd command succeeded.
if [[ $(cat /etc/passwd | awk "/$username/{print}") ]]
then
    echo "Username added succeed."
else
    echo "Username could not be created."
    exit 1
fi

# We don't want to tell the user that an account was created when it hasn't been.

# Set the password.

# echo $password | passwd --stdin $username  # -> Other way.
echo "$username:$password" | chpasswd

# Check to see if the passwd command succeeded.

if [[ $? -ne 0 ]]
then
    echo "Password couldn't be created."
    exit 1
fi
# Force password change on first login.

passwd -e $username
# Display the username, password, and the host where the user was created.

echo $username
echo $password
echo $PWD