#!/bin/bash

bsize=$(blockdev --getsize $1)

echo -e "The total size of " $1 " is " $bsize " blocks."

while (true); do
    bread=$RANDOM
    bigrandom=$(((RANDOM<<15)|RANDOM))  #30 bit random
    let "bmax=bsize-bread"
    let "brandom=bigrandom%bmax"
    echo -e "Reading " $bread " blocks starting from " $brandom 
    dd if=$1 of=/dev/null skip=$brandom count=$bread
done
