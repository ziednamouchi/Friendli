read -p "Enter the name of the file" file
if test -e $file; then
echo "[!] The file you wan to create already exists !!"
else
echo "[+] The file will be created in your home directory!"
touch ~/$file
fi
