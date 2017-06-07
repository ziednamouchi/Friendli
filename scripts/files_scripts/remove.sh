read -p "Enter the file name" file
if test -e ~/$file; then
echo " [!] The file will be deleted from your home directory!"
rm ~/$file
else
echo " [-] The file doesn't exist!"
