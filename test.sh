#!/bin/env bash
# this is a test for new commands i'm unfamiliar with

date=$(date "+Start-Date: %Y-%m-%d")

while read -r line || [[ -n "$line" ]]; do
    if [[ "$line" =~ "Commandline:" ]]; then
        echo "$line" >> test1.txt
    fi
done < "/var/log/apt/history.log"
