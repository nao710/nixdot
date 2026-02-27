## Add another Drive
'''sh
sudo fdisk /dev/sda
g
n
w

sudo mkfs.ext4 -L drive_name /dev/sda1
sudo mount /dev/sda1
sudo nixos-generate-config
'''
