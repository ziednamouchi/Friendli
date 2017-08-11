#!/bin/bash
echo "1) system update"
echo "2) system upgrade"
echo "3) system dist-upgrade"
echo "4) back"
echo "5) exit"

verif_update(){
x=`tail -n 1 update.out`
 if [ "$x" = "Lecture des listes de paquets…" ];then
  local y=1
 else
  local y=0
 fi

echo $y
}

verif_upgrade(){

 if [ tail -n 1 upgrade.out | grep -i upgraded ];then
  local y=1
 else
  local y=0
 fi

echo $y
}

verif_distupgrade(){
x=`tail -n 1 upgrade.out`
 if [ "$x" = "Lecture des listes de paquets…" ];then
  local y=1
 else
  local y=0
 fi

echo $y
}

read -p "menu-update>" choice
case $choice in
 1) apt-get update > update.out 2>&1
	result=$(verif_update)
	if [ "$result" -eq 1 ]; then
	 echo "update successful"
	else
	 echo " update unsuccessful"
	fi 
	rm update.out;;

 2) apt-get upgrade > upgrade.out 2>&1
	result=$(verif_upgrade)
	if [ "$result" -eq 1 ]; then
	 echo "update successful"
	else
	 echo " update unsuccessful"
	fi 
	rm upgrade.out;;

 3) apt-get dist-upgrade > dist.out
  	result=$(verif_distupgrade)
	if [ "$result" -eq 1 ]; then
	 echo "update successful"
	else
	 echo " update unsuccessful"
	fi 
	rm dist.out;;

4) source menu_principal.sh;;
5) source sc_exit;;
esac
