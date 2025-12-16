#!/bin/env bash
function display_pkg ()
{
	log=$(cat "/var/log/apt/history.log") # () used to run a command
	current_date=$(date "+Start-Date: %Y-%m-%d")
	cat "$log" | grep "^$current_date"

}

PS3="Please enter a choice: " # the PS3 variable name is the prompt for the select statement
options=("recently installed packages" "delete packages" "quit")
select opt in "${options[@]}"
do
	case $opt in
		"recently installed packages")

		echo "${log:current_date}"
		;;

		"delete packages")
		;;

		"quit")
		break
		;;
		*) echo "invalid option $REPLY"	
	esac
done
