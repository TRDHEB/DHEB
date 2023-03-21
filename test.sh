#!/usr/bin/env bash

EDIT2_WORK_FOLDR="/Volumes/Promise Pegasus/GRACIANO_ROCCHIGIANI/_OLAF"


PEGASUS="/Volumes/Promise Pegasus"
if mount | grep "on $PEGASUS" > /dev/null; then
    PEGASUS_MOUNTED=true
    echo "Pegasus mounted"
else
    echo "Pegasus not mounted"
fi


DE2="/Volumes/DHEB_EDIT-2"
if mount | grep "on $DE2" > /dev/null; then
    DE2_MOUNTED=true
    echo "DHEB Edit 2 mounted"
else
    echo "DHEB Edit 2 not mounted"
fi


if PEGASUS_MOUNTED=true && DE2_MOUNTED=true; then
    echo "Pegasus and DE2 mounted"
    cd /Volumes/DHEB_EDIT-2/_DHEB
fi



echo "done"
read