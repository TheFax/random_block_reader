# random_block_reader
Small bash script that read a random number of blocks in a random position of a defined device.
I used this script to trigger the built-in self-repair function of a suspect hard disk.

The result is similar to a single pass with 'badblocks' in read-only mode with some differences.
The biggest difference is that badblocks reads data sequentially; on the contrary, random_block_reader reads data in random positions, MOVING A LOT the disk heads.

This script is obviously intended for mechanical disk, not for SSD or solid states disks.
