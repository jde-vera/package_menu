#!/bin/env bash
# this is a test for new commands i'm unfamiliar with

date=$(date "+Start-Date: %Y-%m-%d")

test="is"

if [ -e "prac.txt" ]; then
    echo "naur"
else
    cat "/var/log/apt/history.log" >> prac.txt
fi
format="Start-Date: 2025-12-01"
echo $(sed -n "/Start-Date: 2025-12-01/,$p" prac.txt) # -n allows you to control which lines are printed, $ marks the end and p is to print

while read -r line || [[ -n "$line" ]]; do
    echo "$line"
done < "test.txt"
