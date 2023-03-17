#!/usr/bin/env bash


today=$(date +'%y%m%d')
jdir="${today}_J"
cdir="${today}_C"
adir="${today}_A"

LOCALMOUNTPOINT="/Volumes/DHEB_EDIT-2"
if mount | grep "on $LOCALMOUNTPOINT" > /dev/null; then
    echo "mounted"
    # go to the assist directory
	cd /Volumes/DHEB_EDIT-2/_DHEB

	# make directories for Joerg, Christin, and Assist backup
	mkdir $jdir
	mkdir $cdir
	mkdir $adir

	echo "Created Joerg backup"

	# Deleteold project copy in ASSIST folder
	rm -rf /Volumes/DHEB_EDIT-2/_DHEB/GRACIANO_ROCCHIGIANI/*
	# Copy Joerg's copy to the ASSIST folder
	cp -a /Users/konterfei28/Documents/Avid\ Projects/GRACIANO_ROCCHIGIANI/* /Volumes/DHEB_EDIT-2/_DHEB/GRACIANO_ROCCHIGIANI/
	echo "Copied Joerg - GRACIANO_ROCCHIGIANI"
	#backup Joerg project
	cp -a /Users/konterfei28/Documents/Avid\ Projects/GRACIANO_ROCCHIGIANI/* ./$jdir/
	echo "Backed up Joerg"

    #remove old assist folder
    rm -rf /Volumes/DHEB_EDIT-2/_DHEB/GRACIANO_ROCCHIGIANI/ASSIST/*
    # copy contents of yesterday's assist folder
	cp -a /Volumes/DHEB_EDIT-2/00_Project/GRACIANO_ROCCHIGIANI/ASSIST/* /Volumes/DHEB_EDIT-2/_DHEB/GRACIANO_ROCCHIGIANI/ASSIST/
	echo "Copied GR/ASSIST"
	cp -a /Volumes/DHEB_EDIT-2/00_Project/GRACIANO_ROCCHIGIANI/ASSIST/* ./$adir/
	echo "Backed up Assist"

else
    echo "DHEB_EDIT-2 not mounted"
fi


LOCALMOUNTPOINT="/Volumes/DHEB_EDIT-1"

if mount | grep "on $LOCALMOUNTPOINT" > /dev/null; then
    echo "mounted"
    #Update Christine
	rm -rf /Volumes/DHEB_EDIT-2/_DHEB/GRACIANO_ROCCHIGIANI/01_CHRISTIN/*
	cp -a /Volumes/DHEB_EDIT-1/GRACIANO_ROCCHIGIANI/01_CHRISTIN/* /Volumes/DHEB_EDIT-2/_DHEB/GRACIANO_ROCCHIGIANI/01_CHRISTIN/
	echo "Copied 01_Christin"
	cp -a /Volumes/DHEB_EDIT-1/GRACIANO_ROCCHIGIANI/01_CHRISTIN/* /Volumes/DHEB_EDIT-2/_DHEB/$cdir/
	echo "Backed up 01_Christin"

else
    echo "DHEB_EDIT-1 not mounted"
fi


read