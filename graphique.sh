#! /bin/bash

echo "pilote vidéo  :"
PS3='> '   # le prompt
LISTE=("[g] generique" "[n] nvidia" "[t] nvidia-lts" "[b] hybride-bumblebee")  # liste de choix disponibles
select CHOIX in "${LISTE[@]}" ; do
    case $REPLY in
        1|g)
        pacman -S pacman -S xorg-{server,xinit,apps} xf86-input-libinput xdg-user-dirs xf86-video-vesa --noconfirm
        echo "appuyer pour continuer..."
        break
        sh ./noyau.sh
        ;;
        2|n)
        pacman -S pacman -S xorg-{server,xinit,apps} xf86-input-libinput xdg-user-dirs xf86-video-vesa mesa-demos nvidia nvdia-settings nvidia-libgl libva-vdpau-driver --noconfirm
        systemctl enable nvidia-persistenced.service
        echo "appuyer pour continuer..."
        break
        sh ./noyau.sh
        ;;
        3|t)
         pacman -S pacman -S xorg-{server,xinit,apps} xf86-input-libinput xdg-user-dirs xf86-video-vesa mesa-demos nvidia-lts nvdia-settings nvidia-libgl libva-vdpau-driver --noconfirm
        systemctl enable nvidia-persistenced.service
        echo "appuyer pour continuer..."
        break
        sh ./noyau.sh
        3|b)
         pacman -S pacman -S xorg-{server,xinit,apps} xf86-input-libinput xdg-user-dirs xf86-video-vesa mesa-demos mesa xf86-video-intel bumblebee nvidia nvdia-settings nvidia-libgl libva-vdpau-driver --noconfirm
        gpasswd -a  $user bumblebee
        systemctl enable bumblebeed.service
        echo "appuyer pour continuer..."
        break
        sh ./noyau.sh
        
        
    esac
done





