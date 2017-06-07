choice="y"
while $choice="y"
do
read -p "Enter the name of the file" file
if test -e $file; then
echo "[!] The file you wan to create already exists !!"
read -p "Do you want to choose another file? [n/y]" choice
else
echo "[+] The file will be created in your home directory!"
touch ~/$file
read -p "Do you want to choose another file? [n/y]" choice
fi
done
