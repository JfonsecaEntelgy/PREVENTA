# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 01/09/2021
#!/bin/bash
script="AddMultiUser.sh"
ruta=/home/jfonseca
ruta2=/tmp
fwh=$1
group=$2
users=$3
f_inv=INV_FW.ini
login=$(cat $ruta/$f_inv | grep $fwh | awk '{print $3}' | cut -d ":" -f2)
password=$(cat $ruta/$f_inv | grep $fwh | awk '{print $4}' | cut -d ":" -f2)
/usr/bin/sh $ruta2/$script $fwh $group $users $login $password


