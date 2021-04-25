#! /bin/bash

echo "=================================="
echo "installation de la base du systeme"
echo "=================================="
read -p "quel kernel vouslez vous installer ?" noyau
pacstrap /mnt base base-devel pacman-contrib $noyau $noyau-headers linux-firmware nano grub
pacstrap /mnt zip unzip p7zip nano mc alsa-utils syslog-ng mtools dosfstools lsb-release ntfs-3g exfat-utils bash-completion dialog lzop networkmanager

# inscription des points de montage
echo "ecriture des partitions dans le fstab"
genfstab -U -p /mnt >> /mnt/etc/fstab

echo "on chroot le systeme"
arch-chroot /mnt

echo "parametrage de la langue..."
sh ./lang.sh
