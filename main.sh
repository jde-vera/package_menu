#!/bin/env bash
function display_pkg ()
{	
	# i will add this feature at a later date:
	log=$"/var/log/apt/history.log" # () used to run a command
	# current_date=$(date "+Start-Date: %Y-%m-%d")
	# cat "$log" | grep "^$current_date"

	while read -r line || [[ -n "$line" ]]; do
		if [[ "$line" =~ "Commandline: /usr/bin/apt install" ]]; then
			echo "$line" >> "display.txt"
		fi
	done < "$log"
	
	printf "%s\n" "$(cat "display.txt")"

	rm "display.txt"
}

PS3="Please enter a choice: " # the PS3 variable name is the prompt for the select statement
options=("recently installed packages" "delete packages" "quit")
select opt in "${options[@]}"
do
	case $opt in
		"recently installed packages")

		display_pkg
		;;

		"delete packages")
		;;

		"quit")
		break
		;;
		*) echo "invalid option $REPLY"	
	esac
done
