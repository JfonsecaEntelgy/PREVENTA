# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 31/08/2021
#!/bin/bash

ruta="/tmp"
script="FWAddNewAddressBlacklist_v3.sh"
host=$1
address=$2
login=$3
password=$4

echo $address > /tmp/address
ipS=$(cat /tmp/address | tr "," "\n")
echo $ipS > /tmp/address2
for IP in `cat /tmp/address2`
do
    if [ $IP == "0.0.0.0" ];then
        echo "la Ip: $IP  No se premite adicionar por políticas de Seguridad" >> /tmp/address2
    else
        /usr/bin/expect $ruta/$script $host $login $password $IP
    fi
done
rm -rf /tmp/address