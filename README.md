# random_block_reader
Small (and imperfect, I know) bash script that read a random number of blocks in a random position of a defined device.  
Reading data in random positions means **disk heads will move a lot** on the disk surface.

This script can be used in different scenarios:
* Test a disk in a **very high stress condition**
* Test the voice coil of hard disk
* Trigger the built-in self-repair function of a suspect hard disk
* Seeing the heads of a disassembled hard disk moving

This script is obviously intended for mechanical disk, not for SSD or solid states disks.
