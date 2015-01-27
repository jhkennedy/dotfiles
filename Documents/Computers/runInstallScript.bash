#!/bin/bash

# check input arguments
if (( $# != 1 )) ; then
    echo "Woopsies! Usage: $0 INSTALL_SCRIPT"
    exit 1
fi

./${1} 1> >(tee ${1}.log) 2> >(tee ${1}.err >&2)

# see if anything didn't install
echo " "
echo "=========================================="
echo " Install finished... lets see how it went!"
echo "=========================================="
echo " "

more ${1}.err

#cat ubi1404_HPz420.log | sed -n '/Ign/!p' \
#                       | sed -n '/Hit/!p' \
#                       | sed -n '/Get/!p' \
#                       | sed -n '/Reading/!p' \
#                       | sed -n '/Building/!p' \
#                       | sed -n '/already the newest/!p' \
#                       | sed -n '/Requirement already satisfied/!p' \
#                       | sed -n '/Press/!p'
