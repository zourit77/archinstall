#! /bin/bash

read -p "quel kernel voulez vous installer ?" noyau
pacman -S  $noyau $noyau-headers linux-firmware nano --noconfirm

