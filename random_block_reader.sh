#!/bin/bash
#usage:   random_block_reader device
#example: random_block_reader /dev/sda

#retrieve the size of the block device
bsize=$(blockdev --getsize $1)

echo -e "The total size of " $1 " is " $bsize " blocks."

#forever:
while (true); do
    bread=$RANDOM   #How many sector should we read? 
    bigrandom=$(((RANDOM<<15)|RANDOM))  #The starting sector (30 bit random)
    let "bmax=bsize-bread"
    let "brandom=bigrandom%bmax"
    echo -e "Reading " $bread " blocks starting from " $brandom 
    dd if=$1 of=/dev/null skip=$brandom count=$bread
done
