apt install gdisk

sgdisk -u 4:d1a7cc7e-2372-a147-92bd-01e5f82e6e34 /dev/sda

 title gentoo
efi /gentoo.efi

# opional if not set partuuid
options root=/dev/sda4 rw quiet 

