#!/bin/env bash
function display_pkg ()
{	
	log=$"/var/log/apt/history.log" # () used to run a command
	
	if [[ -e "user_os.txt" ]]; then # create temp txt file storing user system info
    :
	else
    	cat "/etc/os-release" >> "user_os.txt"
	fi

	os_check=$(grep '^NAME=' "user_os.txt") # used to check user os and to handle error with files
	os_check=${os_check,,} 

	while true; do
		read -p "What is your package manager: " pkg_mg
		if [[ ("$os_check" =~ "mint" && "$pkg_mg" == "apt") || ("$os_check"  =~ "fedora" && "$pkg_mg" == "dnf") || ("$os_check"  =~ "arch" && "$pkg_mg" == "pacman") ]]; then
			rm "user_os.txt"
			break
		else
			echo "Enter a valid package manager (apt, dnf, pacman)"
		fi	
	done

	format="Commandline: /usr/bin/"
	format+="$pkg_mg install"

	while read -r line || [[ -n "$line" ]]; do
		if [[ "$line" =~ "$format" ]]; then 
			echo "$line" >> "display.txt"
		fi
	done < "$log"
	
	printf "%s\n" "$(cat "display.txt")"

	rm "display.txt"
}

function rmv_pkg ()
{
	param="$@" # i couldn't do parameter expansion directly i.e "${#@}"

	if [[ "${#param}" == 0 || "${#param}" >1 ]]; then 
		echo "Too many arguments passed"
		return -1
	else
		sudo apt-get --purge remove $1
	fi
	return 0
}

function which_pkg ()
{

	while true; do
	read -p "Which package do you want to delete: " pkg
		if [[ "$(rmv_pkg "$pkg")" == -1 ]]; then 
			:
		else
			break
		fi
	done
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

		which_pkg
		;;

		"quit")
		break
		;;
		*) echo "invalid option $REPLY"	
	esac
done
