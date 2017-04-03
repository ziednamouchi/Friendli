read -p " Username please: " username

user=`cat /etc/passwd | grep -i $username | cut -d: -f1`

if [ "$user" = "$username" ]; then
 read -p " Username already exists please choose another one: " username
else
 useradd -m $username 2>/dev/null
 passwd
 if [ passwd ]; then
  echo " Reenter the password: "
  passwd
 else
  echo " paswword successfully set"
 fi
fi

