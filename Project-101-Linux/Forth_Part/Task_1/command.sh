#!/bin/bash

ipadres=$(cat info.json | grep -i "privateip" | cut -d'"' -f4 | awk '/1/ {print}' | sort | uniq)

sed -i "s/ec2-private_ip/$ipadres/" terraform.tf

if [[ $? -eq 1 ]]
then
    echo "Yemedi"
    exit 1
fi

