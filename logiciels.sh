#! /bin/bash

pacman -Syy networkmanager --noconfirm
pacman -S gst-plugins-{base,good,bad,ugly} gst-libav --noconfirm
pacman -S ttf-{bitstream-vera,liberation,freefont,dejavu} freetype2 --noconfirm
pacman -S cups gimp gimp-help-fr --noconfirm
pacman -S foomatic-{db,db-ppds,db-gutenprint-ppds,db-nonfree,db-nonfree-ppds} gutenprint --noconfirm
pacman -S libreoffice-still-fr hunspell-fr --noconfirm
pacman -S chromium thunderbird-i18n-fr htop ciano gnome-multi-writer gparted grub-customizer shotwell notepadqq vlc libmicrodns protobuf --noconfirm

