#!/bin/bash

cat event_history.csv | grep -i "serdar" | grep -i "Terminate" | grep -Eo "i-.{17}" | sort | uniq > result.txt