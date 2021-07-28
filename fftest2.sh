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

read -p "Write folder name for test files: " USERFOLDER
read -p "How many test files to create? " NUMFILE

while [ $STARTNUM -le $NUMFILE ]
	do
		CRFILE+=($STARTNUM )
		((STARTNUM++))
	done

if [ -e $USERFOLDER ]
then
	USERFOLDER2=$USERFOLDER$RANDOM
	mkdir $USERFOLDER2
	echo "Folder named $USERFOLDER already existed, folder $USERFOLDER2 created instead"
	cd $USERFOLDER2
	fileCreate
else
	mkdir $USERFOLDER
	echo "Folder named $USERFOLDER created"
	cd $USERFOLDER
	fileCreate
fi

