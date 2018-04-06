#!/bin/bash
while test 1=1
do
echo "====================================="
echo "Welcome to medical store project !"
echo "1. Add medicines"
echo "2. Delete medicines"
echo "3. Get list of medicines"
echo "4. Exit"
echo "Select your choice"
read n
echo "=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/="
case $n in
	"1")	echo "Add medicines (Press Ctrl + D to stop)"
			echo "Enter medicine name"
			read medName
			echo $medName > new
			echo "Enter its quantity"
			read mQ
			for((q=0;q<$mQ;q++))
			{
			cat new >> store
			}
			;;
			
	"2")	echo "Delete medicines"
			echo "Enter the name of the medicine you want to delete : "
			read medNameDel 
			#working
			lineNumber=`grep -n -m 1 $medNameDel store | cut -f1 -d:`
			echo ""
			sed "${lineNumber}d" store | cat > temp
			cat temp > store
			;;
			
	"3")	echo "Medicines list currently in store"
			for w in `cat store`;
			do echo $w;
			done|sort|uniq -c
			#cat store
			;;
	
	"4")	exit 0
			;;
			
	*) echo "Wrong Choice";;
esac
echo "******************************************"
done
