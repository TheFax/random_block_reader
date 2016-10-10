#!/bin/bash
if [-z $1]; then
   echo "Please specify a block device."
   echo " example:"
   echo " ./random_block_reader.sh /dev/sdz"
   exit 1
fi

if [ ! -b "$1" ]; then
   echo $1 " is not a block device!"
   exit 1
fi

bsize=$(blockdev --getsize $1)

echo -e "The total size of " $1 " is " $bsize " blocks."

while (true); do
    bread=$RANDOM
    bigrandom=$(((RANDOM<<15)|RANDOM))  #30 bit random
    let "bmax=bsize-bread"
    let "brandom=bigrandom%bmax"
    echo -e "Reading " $bread " blocks starting from " $brandom 
    dd if=$1 of=/dev/null skip=$brandom count=$bread
    if [ "$?" != "0" ]; then
       echo "Error trigger!"
       exit 1
    fi
done
