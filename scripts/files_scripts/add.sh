read -p "Enter the name of the file" file
if test -e $file; then
echo " The file you wan to create already exists"
else
touch $file
fi
