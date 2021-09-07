# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 06/09/2021
#!/bin/expect

## Access CLI

set host [lindex $argv 0]
set user [lindex $argv 1]
set loginUser [lindex $argv 2]
set loginPassword [lindex $argv 3]

eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no $loginUser@$host
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "$loginPassword\r"
set timeout 4
expect "):"
send "a"
expect "#"
send "show user group | grep -f $user\n"
expect "#"; exit 0
expect eof