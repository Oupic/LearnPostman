#! /bin/bash

#Variables
STARTNUM=1
declare -a CRFILE #array declare

#function for creating files
function fileCreate() {
	for FILE in ${CRFILE[@]}
	do
		touch "testfile"$FILE".txt"
		echo "testfile"$FILE".txt created"
	done
}

#Start
read -p "Write folder name for test files: " USERFOLDER


#Folder exists check
if [ -e $USERFOLDER ]
then 
	echo "Folder with this name exists, use different name."
else
	read -p "How many test files to create? " NUMFILE
	mkdir $USERFOLDER
	echo "Folder named $USERFOLDER created"
	cd $USERFOLDER

#Adding user specified total of numbers to array
	while [ $STARTNUM -le $NUMFILE ]
	do
		CRFILE+=($STARTNUM )
		((STARTNUM++))
	done

#executing function
	fileCreate 
fi	


	
	
	
