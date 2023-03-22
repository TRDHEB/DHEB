#!/usr/bin/env bash

# setup environmental variables
TEMP_PROJ="/Volumes/DHEB_EDIT-2/_DHEB/GRACIANO_ROCCHIGIANI"
EDIT2_FOLDER="/Volumes/Promise Pegasus/GRACIANO_ROCCHIGIANI/_OLAF"
JOERG_FOLDER="/Users/konterfei28/Documents/Avid Projects/GRACIANO_ROCCHIGIANI"
ASSIST_FOLDER="/Volumes/DHEB_EDIT-2/00_Project/GRACIANO_ROCCHIGIANI/ASSIST"
CHRISTIN_FOLDER="/Volumes/DHEB_EDIT-1/GRACIANO_ROCCHIGIANI/01_CHRISTIN"

# Env variables for hard drives
RAID="/Volumes/16TB_RAID"
PEGASUS="/Volumes/Promise Pegasus"
DE1="/Volumes/DHEB_EDIT-1"
DE2="/Volumes/DHEB_EDIT-2"

today=$(date +'%y%m%d')
jdir="${today}_J"
sdir="${today}_S"
cdir="${today}_C"
adir="${today}_A"


PEGASUS_MOUNTED=false
DE2_MOUNTED=false
DE1_MOUNTED=false
RAID_MOUNTED=false

# move to the _DHEB temp directory
cd $TEMP_DIR

# remove old backups if they exist
rm -rf $jdir
rm -rf $cdir
rm -rf $adir
rm -rf $adir

# create clean directories for each backup
mkdir $jdir
mkdir $cdir
mkdir $adir
mkdir $adir

############################################
# See which drives are mounted
############################################

if mount | grep "on $RAID" > /dev/null; then
    RAID_MOUNTED=true
    echo "DHEB Edit 2 mounted"
else
    echo "DHEB Edit 2 not mounted"
fi

if mount | grep "on $PEGASUS" > /dev/null; then
    PEGASUS_MOUNTED=true
    echo "Pegasus mounted"
else
    echo "Pegasus not mounted"
fi

if mount | grep "on $DE2" > /dev/null; then
    DE2_MOUNTED=true
    echo "DHEB Edit 2 mounted"
else
    echo "DHEB Edit 2 not mounted"
fi

if mount | grep "on $DE1" > /dev/null; then
    DE1_MOUNTED=true
    echo "DHEB Edit 2 mounted"
else
    echo "DHEB Edit 2 not mounted"
fi

############################################
# Consolidate and backup the project
############################################


if RAID_MOUNTED=true && DE2_MOUNTED=true; then
    echo "RAID and DE2 mounted"
    cd /Volumes/DHEB_EDIT-2/_DHEB

    rm -rf $TEMP_PROJ/*
    echo "emptied temp project contents"

    cp -a $JOERG_FOLDER/* $TEMP_PROJ/
    echo "Copied Joerg's project to the temporary project directory"

    cp -a $JOERG_FOLDER/* ./$jdir/
    echo "Backed up Joerg's project"

    rm -rf $TEMP_PROJ/ASSIST/*
    cp -a $ASSIST_FOLDER/* $TEMP_PROJ/ASSIST/
    echo "updated ASSIST folder in temp project"
    cp -a $ASSIST_FOLDER/* ./$adir/
    echo "Backed up ASSIST folder"

else
    echo "RAID and DE2 not mounted"
fi



echo "done"
read