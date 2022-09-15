#!/bin/bash

cat certificate.pem | sed -e 's/\\n/\n/g' > new.pem

# other solutions

# echo -e $(cat certificate.pem) > new.pem

# awk '{gsub(/\\n/,"\n")}1' certificate.pem | tee new.pem

# MY_KEY=$(cat certificate.pem)
# echo $MY_KEY
# echo -e $MY_KEY > new.pem