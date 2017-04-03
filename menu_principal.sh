
# ----------------------------------------------
#  The First menu function
# ----------------------------------------------
show_first_menu(){
echo "1)System"
echo "2)Managing users"
echo "3)Managing files and directories"
echo "4)Configuring firewall"
echo "5)Planning system tasks"
echo "6)System update and upgrade"
echo "7)exit"
echo "8)readme"
}


# ----------------------------------------------
#  read_me function
# ----------------------------------------------
read_me(){
echo -e "\n"
echo -e "   This is the help provided by the developer of this tool.
If you are new to linux I strongly recommend you to start by reading the manual of each command before using it, to do this you just have to type man followed by the name of the command.
As for this tool, you will find a wide range of menus helping you to carry out administrative tasks on your machine even if you do not yet master linux. This is intended for new linux users who are fed up with user interfaces that stagnate the brain and that are not yet accustomed to the terminal. Type back to go back and exit to terminate this program"
echo -e "\n"
}

# ----------------------------------------------
#  Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
#trap '' SIGINT SIGQUIT SIGTSTP


# -----------------------------------
# Main logic - infinite loop
# ------------------------------------

./wallpaper
show_first_menu
read -p "FriendLi/menu>" choice
case $choice in
		1) clear; sh scripts/system_menu ;;
		2) clear; sh scripts/users_menu ;;
		3) clear; sh scripts/files_menu ;;
		4) clear; sh scripts/firewall_menu ;;
		5) clear; sh scripts/cron_menu ;;
		6) clear; sh scripts/menu_update ;;
 		7) clear; sh scripts/sc_exit ;;
		8) clear
		   read_me 
		   show_first_menu
		   read -p "FriendLi/menu>" choice;;
		*) clear; echo "Bad choice please choice"
		   read -p "FriendLi/menu>" choice;;

	esac  
	
                                                     


