#! /bin/bash

# Mot de passe ROOT
echo "definir le mot de passe ROOT :"
passwd root

echo "bon garçon... !"
# ajout de l'utilisateur
read -p "definir un nom d'utilisateur :" user
useradd -m -g wheel -c $user -s /bin/bash $user
echo "definir le mot de passe pour $user :"
passwd $user
echo "très bien ..."
sed -i -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers


sh ./logiciels.sh

