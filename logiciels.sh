#! /bin/bash

read -p "methode installation acpi (acpi_call, acpi_call-lts) :" acpid
pamcan -S $acpid

pacman -Syy networkmanager --noconfirm
pacman -S gst-plugins-{base,good,bad,ugly} gst-libav --noconfirm
pacman -S ttf-{bitstream-vera,liberation,freefont,dejavu} freetype2 --noconfirm
pacman -S cups gimp gimp-help-fr --noconfirm
pacman -S foomatic-{db,db-ppds,db-gutenprint-ppds,db-nonfree,db-nonfree-ppds} gutenprint --noconfirm
read -p "methode d'instalaltion libreoffice : (fresh ou still) :" lofce
pacman -S libreoffice-$lofce-fr hunspell-fr --noconfirm
pacman -S chromium vivaldi vivaldi-ffmpeg-codecs youtube-dl thunderbird-i18n-fr htop ciano gnome-multi-writer gparted grub-customizer shotwell notepadqq vlc libmicrodns protobuf --noconfirm
 "continuez pour installer un desktop"
 break
echo "continuez pour installer un desktop"
break
sh ./desktop.sh
