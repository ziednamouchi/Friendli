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

read -p "fichier: " fichier
result=$(verif)

while [ $result -eq 1 ]
do
	echo "[!] The file you wan to create already exists !!"
	read -p "Please choose another file name: " fichier
	result=$(verif)
done

echo "[+] The file will be created in your home directory!"
touch ~/$fichier
echo " FIle created!!"
read -p "Do you want to choose another file? [n/y]: " choice
while [ "$choice" != "n" ] && [ "$choice" != "y" ]
do
	echo "bad choice"
	read -p "Please enter (y) for yes or (n) for no: " choice
done
if [ $choice = "n" ];then
	break
	clear; sh scripts/users_menu.sh ;;
elif [ $choice = "y" ]; then
	continue
	
fi
	
done
