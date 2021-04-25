#! /bin/bash

cfdisk

echo "appuyez sur une touche pour contnuer"
break

echo "========================"
echo "montage des partitions :"
echo "========================"


fdisk -l

read -p "type de disque : (sda, vda...)" d

mkfs.vfat -F32 /dev/$d1
mkfs.ext4 /dev/$3
echo "formatage terminé"


mkswap /dev/$d2
swapon /dev/$d2
echo "montage du swap teminé"

mount /dev/$d3 /mnt
mkdir /mnt/{boot,home}
mount /dev/$d1 /mnt/boot
mount /dev/$d3 /mnt/home
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
