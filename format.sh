#! /bin/bash

cfdisk

echo "appuyez sur une touche pour contnuer"
break

echo "========================"
echo "montage des partitions :"
echo "========================"


fdisk -l

#read -p "type de disque : (/sev/sda, /dev/vda...)" d

mkfs.ext2 /dev/vda1
mkfs.ext4 /dev/vda3
echo "formatage terminé"


mkswap /dev/vda2
swapon /dev/vda2
echo "montage du swap teminé"

mount /dev/vda3 /mnt
mkdir /mnt/{boot,home}
mount /dev/vda1 /mnt/boot
mount /dev/vda3 /mnt/home
echo "montage du systeme de fichiers terminé"

#choix suivant installation du systeme

PS3='> '   # le prompt
LISTE=("[o] installer la base systeme ?" "[n]  arrêter ici")  # liste de choix disponibles
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
