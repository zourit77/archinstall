#! /bin/bash

cfdisk

echo "appuyez sur une touche pour contnuer"
break

echo "========================"
echo "montage des partitions :"
echo "========================"

echo "boot : (/mnt/boot)"
read arch-boot

echo "home : (/mnt/home)"
read arch-home

echo "root : (/mnt)" 
read ach-root

fdisk -l
echo "type de disque : (sda, vda...)"
read disque

mkfs.vfat -F32 /dev/$disque1
mkfs.ext4 /dev/$disque3
echo "formatage terminé"


mkswap /dev/$disque2
swapon /dev/$disque2
echo "montage du swap teminé"

mount /dev/$disque3 $arch-root
mkdir /mnt/{boot,home}
mount /dev/$disque1 $arch-boot
mount /dev/$disque3 /mnt/home
echo "montage du systeme de fichiers terminé"

#choix suivant installation du systeme

PS3='> '   # le prompt
LISTE=("[o] oui" "[n]  non")  # liste de choix disponibles
select CHOIX in "${LISTE[@]}" ; do
    case $REPLY in
        1|o)
        echo installation du systeme de base...
	sh ./base.sh
        break
        ;;
        2|n)
        echo ok on en reste la...
        break
        ;;
    esac
done
