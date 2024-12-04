#!/bin/bash

# Usage: random_block_reader device
# Example: random_block_reader /dev/sda

device="$1"

# Check if the argument provided is a device
if [[ -z "$device" ]]; then
    echo "Usage: $0 device"
    echo "Example: $0 /dev/sda"
    exit 1
fi

# Get the device size in bytes
device_size=$(blockdev --getsize "$device")

# Get the block size in bytes
block_size=$(blockdev --getbsz "$device")

# Calculate the number of blocks
block_count=$((device_size / block_size))

echo "The total size of $device is $block_count blocks of size $block_size bytes."

while true; do
    # Generate a random number of blocks to read (between 1 and 1000)
    read_count=$((RANDOM % 1000 + 1))

    # Generate a random starting block (between 0 and block_count - read_count)
    start_block=$((RANDOM % (block_count - read_count)))

    echo "Reading $read_count blocks starting from block $start_block"

    # Use dd to read the random blocks, specifying the block size
    dd if="$device" of=/dev/null bs="$block_size" skip="$start_block" count="$read_count" status=none
done
