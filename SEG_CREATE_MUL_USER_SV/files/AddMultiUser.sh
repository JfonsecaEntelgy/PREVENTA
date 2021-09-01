# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha =01/09/2021
#!/bin/bash
ruta="/tmp"
script="CreateUsersFULL.sh"
host=$1
group=$2
users=$3
login=$4
password=$5

echo "Como política, para la creacion de usuarios solo se permite 8 caracteres de tamaño y" > /tmp/logAddUserV2.log
echo "los cracteres alfanumericos seran remplazados por el numero 9." >> /tmp/logAddUserV2.log
echo "Estos son los usuarios creados:" >> /tmp/logAddUserV2.log
echo "" >> /tmp/logAddUserV2.log

echo $users > /tmp/users
Us=$(cat /tmp/users | tr ',' '\n')
echo $Us > /tmp/users2

for uS in `cat /tmp/users2`
do
	echo "Nombre Usuario Ingresado: "$uS >> /tmp/logAddUserV2.log
	echo $uS | tr -c '[:alnum:][:space:]-_.' '9' | cut -c1-8 >> /tmp/listUsers
	tmp=$(echo $uS | tr -c '[:alnum:][:space:]-_.' '9' | cut -c1-8)
	echo "Nombre Usuario Creado: " $tmp >> /tmp/logAddUserV2.log

done
for US in `cat /tmp/listUsers`
do
	/usr/bin/expect $ruta/$script $host $US $group $login $password
done
rm -rf /tmp/users
rm -rf /tmp/users2
rm -rf /tmp/listUsers
