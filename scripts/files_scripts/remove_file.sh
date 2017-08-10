#! /bin/bash

verif(){

	if test -e ~/$fichier; then

		local y=1
	else

		local y=0
	fi
	echo $y
}


while true
	do

	read -p "[-] Please choose a file name: " fichier
	result=$(verif)
	while [ $result -eq 0 ]
	do

		echo "[!] The file you want to remove does not exist !!"
		read -p "[-] Please choose another file name: " fichier
		result=$(verif)

	done

	echo "[+] The file will be removed from your home directory!"
	rm ~/$fichier
	echo "[+] File removed!!"
	read -p "[?] Do you want to choose another file? [n/y]: " choice
	while [ "$choice" != "n" ] && [ "$choice" != "y" ]
	do

		echo "[!] Bad choice"
		read -p "[-] Please enter (y) for yes or (n) for no: " choice

	done
	if [ $choice = "n" ];then

		break
	
	elif [ $choice = "y" ]; then

		continue
	
	fi
	
	done

clear; sh scripts/files_menu.sh 
