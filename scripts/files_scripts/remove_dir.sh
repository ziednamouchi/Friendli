#! /bin/bash

verif(){

	if test -d ~/$dossier; then

		[ "$(ls -A ~/$dossier)" ] && local y=2 || local y=1
		
	else

		local y=0

	fi
	echo $y
}


while true
do

	read -p "[-] Please enter directory name to remove: " dossier
	result=$(verif)
	while [ $result -eq 0 ]
	do

		echo "[!] The directory you want to remove does not exist !!"
		read -p "[-] Please choose another directory name: " dossier
		result=$(verif)

	done

	if [ $result -eq 1 ];then

		echo "[+] The directory will be removed from your home directory!"
		rmdir ~/$dossier
		echo "[+] Directory removed!!"
		read -p "[?] Do you want to choose another directory? [n/y]: " choice
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
	fi
	if [ $result -eq 2 ]; then

		read -p "[+] The directory you want to remove from your home directory is not empty! Are you sure you want to removed although? (y/n)" choice_rm
		while [ "$choice_rm" != "n" ] && [ "$choice_rm" != "y" ]
			do

				echo "[!] Bad choice"
				read -p "[-] Please enter (y) for yes or (n) for no: " choice

			done
		if [ "$choice_rm" = "n" ];then

			break
	
		elif [ "$choice_rm" = "y" ]; then

			rm -rf ~/$dossier
			echo "[+] Directory removed!!"
			read -p "[?] Do you want to choose another directory? [n/y]: " choice
			while [ "$choice" != "n" ] && [ "$choice" != "y" ]
			do

				echo "[!] Bad choice"
				read -p "[-] Please enter (y) for yes or (n) for no: " choice

			done
			if [ "$choice" = "n" ];then

				break
	
			elif [ "$choice" = "y" ]; then

				continue
	
			fi
		fi
	fi
	
done

clear; sh scripts/files_menu.sh 
 
