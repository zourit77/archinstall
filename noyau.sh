#! /bin/bash

read -p "quel kernel voulez vous installer ? (linux, linux-lts ?)" noyau
pacman -S  $noyau $noyau-headers linux-firmware nano --noconfirm

echo "voulez-vous installer l'amorçage GRUB en UEFI ?"
PS3='> '   # le prompt
LISTE=("[o] oui" "[n]  non")  # liste de choix disponibles
select CHOIX in "${LISTE[@]}" ; do
    case $REPLY in
        1|o)
        mkdir /boot/efi
        pacman -S grub efibootmgr --noconfirm
        grub-install /dev/$disque --recheck
        grub-mkconfig -o /boot/grub/grub.cfg
        echo "grub UEFI installé appuyez sur une touche pour continuer..."
        break
        sh ./logiciels.sh
        ;;
        2|n)
        pacman -S grub --noconfirm
        grub-install /dev/$disque
        grub-mkconfig -o /boot/grub/grub.cfg
        
        echo "grub legacy installé appuyez sur une touche pour continuer..."
        break
        sh ./logiciels.sh
        ;;
    esac
done
