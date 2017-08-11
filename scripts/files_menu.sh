#!/bin/bash
# -----------------------------------
# files and directories menu
# ------------------------------------
files_menu(){
wallpaper
echo " 1/ Add file"
echo " 2/ Delete file"
echo " 3/ Add directory"
echo " 4/ Delete directory"
echo " 5/ Back"
echo " 6/ Exit"
}

files_menu
read -p "FriendLi/files>" choice
case $choice in
 1) source scripts/files_scripts/add_file.sh ;;
 2) source scripts/files_scripts/remove_file.sh ;;
 3) source scripts/files_scripts/add_dir.sh ;;
 4) source scripts/files_scripts/remove_dir.sh ;;
 5) source menu_principal.sh ;;
 6) source scripts/sc_exit.sh;;
 *) echo "Bad choice !!!!"
    clear; files_menu
    read -p "FriendLi/files>" choice

esac
