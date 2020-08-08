#!/usr/bin/bash

if [[ `whoami` != "root" ]];then
sudo su
fi


cp bin/Anonfiles /usr/bin/Anonfiles
chmod +x /usr/bin/Anonfiles

echo "Installing Dependencies"
apt install jq
echo "
Completed"
exit
