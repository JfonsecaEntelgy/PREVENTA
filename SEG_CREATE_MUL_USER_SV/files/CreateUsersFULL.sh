# Autor = Ing. Julian Ricardo Fonseca A - Consultor Senior Ansible (Entelgy)
# Fecha = 01/09/2021
#!/bin/expect
## Access CLI
set host [lindex $argv 0]
set user [lindex $argv 1]
set group [lindex $argv 2]
set loginUser [lindex $argv 3]
set loginPassword [lindex $argv 4]

eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no $loginUser@$host
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "$loginPassword\r"
set timeout 2
#expect ":"
#send "a\n"
expect "#"
send "config user local\n"
expect "(local) #"
send "edit $user\n"
expect "($user) #"
send "set type tacacs+\n"
expect "($user) #"
send "set tacacs+-server 'ACS-Telmex2'\n"
expect "($user) #"
send "next\n"
expect "(local) #"
send "end\n"
send "config user group\n"
expect "(group) #"
send "edit $group\n"
expect "($group) #"
send "append member $user\n"
expect "($group) #"
send "end\n"
expect "#"; exit 0
expect eof
