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
 1) sh scripts/files_scripts/add_file.sh ;;
 2) sh scripts/files_scripts/remove_file.sh ;;
 3) sh scripts/files_scripts/add_dir.sh ;;
 4) sh scripts/files_scripts/remove_dir.sh ;;
 5) sh ../menu_principal.sh ;;
 6) sh sc_exit.sh;;
 *) echo "Bad choice !!!!"
    clear; users_menu
    read -p "FriendLi/files>" choice

esac
