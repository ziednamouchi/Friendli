#!/bin/bash


pause(){
	local msg="$@"
	[ -z $entry ] && msg="Press [Enter] key to continue..."
	read -p "$message" EnterKey
}

show_menu(){

	echo "1. Update Source list"
	echo "2. Upgrade system"
	echo "3. Dist-upgrade system"
	echo "4. Back to previous menu"
	echo "5. exit"
}

up_date(){

	if [ -n "$(command -v apt-get)" ];then

		sudo apt-get update && echo "[+] Update successfully done" || echo "[!] Unable to update "
		pause

	elif [ -n "$(command -v yum)" ];then 

		su -c 'yum upgrade' && echo "[+] Upgrade successfully done" || echo "[!] Unable to upgrade "
		pause
	
	fi
	
}

up_grade(){

	if [ -n "$(command -v apt-get)" ];then 
		sudo apt-get upgrade && echo "[+] Upgrade successfully done" || echo "[!] Unable to upgrade "
		pause
	elif [ -n "$(command -v yum)" ];then 
		su -c 'yum upgrade' && echo "[+] Upgrade successfully done" || echo "[!] Unable to upgrade "
		pause

	fi
}

dist_up(){

	if [ -n "$(command -v apt-get)" ];then

		sudo apt-get dist-upgrade && echo "[+] Dist-upgrade successfully done" || echo "[!] Unable to perform dist-upgrade "
		pause

	elif [ -n "$(command -v yum)" ];then 

		echo "[!] You need to read more about redhat distros !!! "
		pause

	fi
}

read_input(){
	
	local input
	read -p "[-] Please enter your choice" input
	case $input in
		1)	up_date ; source menu_principal.sh ;;
		2)	up_grade ; source menu_principal.sh ;;
		3)	dist_up ; source menu_principal.sh ;;
		4)	source menu_principal.sh ;;
		5)	echo "I hope FriendLi was nice to you! See you later!"
			exit 0;;
		
		*)	echo "[!] Wrong choice ! Please try again."
			
	esac
}

clear
show_menu	# display memu
read_input  # wait for user input

