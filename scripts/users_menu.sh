#!/bin/bash
# -----------------------------------
# users menu
# ------------------------------------
users_menu(){
	clear
	sh scripts/wallpaper.sh
	echo "1) add user"
	echo "2) remove user"
	echo "3) back"
	echo "4) exit"
}

users_menu
read -p "FriendLi/users>" choice
case $choice in
	1) source scripts/user_scripts/add.sh ;;
	2) source scripts/user_scripts/remove.sh ;;
	3) source menu_principal.sh ;;
	4) source scripts/sc_exit.sh;;
	*) echo "Bad choice !!!!"
		clear; scripts/users_menu
		read -p "FriendLi/users>" choice

esac
