choice="y"
while $choice="y"
do
read -p "Enter the file name: " file
if test -e ~/$file; then
echo " [!] The file will be deleted from your home directory!"
rm ~/$file
read -p "Do you want to remove another file?[n/y]: " choice
else
echo " [-] The file doesn't exist!"
read -p "Do you want to remove another file?[n/y]: " choice
fi
done
