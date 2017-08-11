#!/bin/bash
# inspired from : 
# grabsysinfo.sh - A simple menu driven shell script to to get information about your 
# Linux server / desktop.
# Author: Vivek Gite
# Date: 12/Sep/2007


pause(){
	local msg="$@"
	[ -z $entry ] && msg="Press [Enter] key to continue..."
	read -p "$message" EnterKey
}


show_menu(){

	echo "1. Operating system info"
	echo "2. Hostname and dns info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. Last logged in users"
	echo "6. Free and used memory info"
	echo "7. Back to previous menu"
	echo "8. exit"
}

os_info(){

	echo "Operating system : $(uname)"
	[ -x /usr/bin/lsb_release ] && /usr/bin/lsb_release -a || echo "[!] lsb_release command does not exist!! Type sudo apt-get install lsb-core to install it :)"
	pause
}

host_info(){
	local dnsips=$(sed -e '/^$/d' /etc/resolv.conf | awk '{if (tolower($1)=="nameserver") print $2}')
	echo "Hostname : $(hostname -s)"
	echo "DNS domain : $(hostname -d)"
	echo "Fully qualified domain name : $(hostname -f)"
	echo "Network address (IP) :  $(hostname -i)"
	echo "DNS name servers (DNS IP) : ${dnsips}"
	pause
}

net_info(){
	echo "Total network interfaces found : $(wc -w<<<$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo"))"
	
	echo "*** IP Addresses Information ***"
	ip -4 address show

	echo "***********************"
	echo "*** Network routing ***"
	echo "***********************"
	netstat -nr

	echo "**************************************"
	echo "*** Interface traffic information ***"
	echo "**************************************"
	netstat -i

	pause 
}

user_info(){
	local cmd="$1"
	case "$cmd" in 
		who) echo " Who is online :"; echo "$(who -H)"; pause ;;
		last) echo " List of last logged in users :";echo "$(last)" ; pause ;;
	esac 
}

mem_info(){
	
	free -m
    
    echo "*********************************"
	echo "*** Virtual memory statistics ***"
    echo "*********************************"
	vmstat
    echo "***********************************"
	echo "*** Top 5 memory eating process ***"
    echo "***********************************"	
	ps auxf | sort -nr -k 4 | head -5	
	pause
}

read_input(){
	
	local input
	read -p "[-] Please enter your choice" input
	case $input in
		1)	os_info ;;
		2)	host_info ;;
		3)	net_info ;;
		4)	user_info "who" ;;
		5)	user_info "last" ;;
		6)	mem_info ;;
		7)	source menu_principal.sh ;;
		8)	echo "I hope FriendLi was nice to you! See you later!"
			exit 0;;
		
		*)	echo "[!] Wrong choice ! Please try again."
			
	esac
}

while true
do
	clear
 	show_menu	# display memu
 	read_input  # wait for user input
done
