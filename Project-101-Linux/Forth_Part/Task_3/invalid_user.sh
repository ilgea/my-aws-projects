#!/bin/bash


cat auth.log | grep -o "Inval.*" | cut -d' ' -f3 | sort -f | uniq -c > result.txt


# other solution

# grep "Failed password for invalid user" auth.log | awk '{print $11}' | sort | uniq -c > result.txt

# cat auth.log | grep "Failed password for invalid user" | awk '{print $11}' | sort | uniq -c

