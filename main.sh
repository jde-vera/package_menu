#!/bin/env bash

PS3="Please enter a choice: " # the PS3 variable name is the prompt for the select statement
options=("recently installed packages" "delete packages" "quit")
select opt in "${options[@]}"
do
	case $opt in
		"recently installed packages")
		cat "/var/log/apt/history.log"
		;;

		"delete packages")
		;;

		"quit")
		break
		;;
		*) echo "invalid option $REPLY"	
	esac
done
