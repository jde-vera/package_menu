#!/bin/env bash
# this is a test for new commands i'm unfamiliar with

date=$(date "+Start-Date: %Y-%m-%d")

while read -r line || [[ -n "$line" ]]; do
    if [[ "$line" =~ "Commandline:" ]]; then
        echo "$line" >> test1.txt
    fi
done < "/var/log/apt/history.log"

if [[ -e "user_os.txt" ]]; then
    :
else
    cat "/etc/os-release" >> "user_os.txt"
fi

os_check=$(grep '^NAME=' "user_os.txt")

if [[ ${os_check,,} =~ "mint" ]]; then # recap $ uses the value and {} is parameter expansion. bash 4+ introduced case modification operators such as ,,
    echo "works!"
fi

function remove_pkg ()
{
    param="$@"
    echo $param | wc -w
}

remove_pkg "test"