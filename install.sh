#!/usr/bin/bash

if [[ `whoami` != "root" ]];then
sudo su
fi

echo "Installing Dependencies"
apt install figlet
apt install lolcat
cp bin/jq /usr/bin/jq
cp Anonfiles.sh /usr/bin/anonfiles
chmod +x /usr/bin/anonfiles
chmod +x /usr/bin/jq
echo "
Completed"
exit
