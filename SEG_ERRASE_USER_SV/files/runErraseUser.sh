# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 01/09/2021
#!/bin/bash

ruta="/tmp"
script="pruebaFiltro.sh"
script2="DelUserGroup.sh"
script3="DeleteUser.sh"
host=$1
user=$2
login=$3
password=$4


/usr/bin/expect $ruta/$script $host $user $login $password >> /tmp/consulta_$user
cat /tmp/consulta_$user  | grep edit | awk '{print $2}' > /tmp/consultaFW_$user
for GRP in `cat /tmp/consultaFW_$user`;
do
        /usr/bin/expect $ruta/$script2 $host $user $GRP $login $password
        sleep 3
done
/usr/bin/expect $ruta/$script3 $host $user $login $password
#rm -rf /tmp/consulta_$user
exit 0
