# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 06/09/2021
#!/bin/bash

ruta2="/tmp"
script="pruebaFiltro.sh"
host=$1
user=$2
login=$3
password=$4

/usr/bin/expect $ruta2/$script $host $user $login $password >> /tmp/consulta_$user
cat /tmp/consulta_$user  | grep edit | awk '{print $2}' > /tmp/consultaFW_$user
rm -rf /tmp/consulta_$user
exit 0
