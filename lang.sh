#! /bin/bash

# Paramètre la langue systeme
echo "KEYMAP=fr-latin9" > /etc/vconsole.conf
echo "LANG=fr_FR.UTF-8" > /etc/locale.conf
echo "Archy" > /etc/hostname
#mv /etc/locale.gen /etc/locale.gen.old
#echo fr_FR.UTF-8 UTF-8 /etc/locale.gen
sed -i -e 's/#fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
export LANG=fr_FR.UTF-8
echo "langue parametrée en francais !"

# Implémente la zone géographique
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc --utc
echo "zone geographique parametrée"

sh ./user.sh
