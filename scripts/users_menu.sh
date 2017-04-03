# -----------------------------------
# users menu
# ------------------------------------
users_menu(){
clear
sh scripts/wallpaper.sh
echo "1) add user"
echo "2) update user"
echo "3) remove user"
echo "4) back"
echo "5) exit"
}

users_menu
read -p "FriendLi/users>" choice
case $choice in
 1) sh /user_scripts/add.sh ;;
 2) sh /user_scripts/update.sh ;;
 3) sh /user_scripts/remove.sh ;;
 4) sh ../menu_principal.sh ;;
 5) sh sc_exit.sh;;
 *) echo "Bad choice !!!!"
    clear; users_menu
    read -p "FriendLi/users>" choice

esac
