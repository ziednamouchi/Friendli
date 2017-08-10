#! /bin/bash

verif(){

	if test -d ~/"$dossier"; then
		local y=1
	else
		local y=0
	fi
	echo $y
}


while true
do

read -p "[-] Please enter the directory name: " dossier
result=$(verif)

while [ $result -eq 1 ]
do
	echo "[!] The directory you want to create already exists !!"
	read -p "[-] Please choose another directory name: " dossier
	result=$(verif)
done

echo "[+] The directory will be created in your home directory!"
mkdir ~/$dossier
echo "[+] Directory created!!"
read -p "[?] Do you want to create another directory? [n/y]: " choice
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
