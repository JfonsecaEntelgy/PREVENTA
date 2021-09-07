# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 06/09/2021
#!/bin/bash
script="runPruebaFiltro.sh"
ruta=/home/jfonseca
ruta2=/tmp
fwh=$1
user=$2
#vdom=$3
f_inv=INV_FW.ini
login=$(cat $ruta/$f_inv | grep $fwh | awk '{print $3}' | cut -d ":" -f2)
password=$(cat $ruta/$f_inv | grep $fwh | awk '{print $4}' | cut -d ":" -f2)
/usr/bin/sh $ruta2/$script $fwh $user $login $password #$vdom 
