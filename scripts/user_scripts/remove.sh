#!/bin/bash
verif(){
	user=`cat /etc/passwd | grep -i $username | cut -d: -f1`

	if [ "$user" = "$username" ]; then

		local y=1

	else

		local y=0

	fi

	echo $y
}


read -p " Do you wan to only remove the user [y] or to remove the user and all its files [n]: " choice 
if [ "$choice" = "y" ]; then
	
	read -p " Username please: " username
	result=$(verif)
	if [ $result -eq 1 ]; then

		userdel  $username

	else

		echo "user does not exist !!!"
		read -p " Username please: " username

	fi
elif [ "$choice" = "n" ]; then

	result=$(verif)
	if [ $result -eq 1 ]; then

		read -p " Username please: " username
		userdel --force $username

	else

		echo "user does not exist !!!"
		read -p " Username please: " username

	fi
else

	echo "bad choice"
	read -p " Do you wan to only remove the user [y] or to remove the user and all its files [n]: " choice

fi
