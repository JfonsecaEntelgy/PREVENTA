# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 01/09/2021
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
#expect "):"
#send "a"
expect "#"
send "config user local\n"
expect "(local) #"
send "delete $user\n"
expect "(local) #"
send "end\n"
expect "#"; exit 0
expect eof
