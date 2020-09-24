#!/usr/bin/bash

if [[ `whoami` != "root" ]];then
sudo su
fi

echo "Installing Dependencies"
cp bin/jq /usr/bin/jq
chmod +x /usr/bin/jq
echo "
Completed"
exit
