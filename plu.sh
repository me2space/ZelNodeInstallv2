#ZelNode Pre-Launch Update for Already Running Nodes
#!/bin/bash

#This script will change owner and group of the zelcash working directory so the daemon runs as a service.
#It will also remove some files that are not needed and put the zelcash-tx binary to /usr/bin directory.

clear
echo -e "\033[1;33m===============================================\033[0m"
echo -e "ZelNode Pre-Launch Update v1.0"
echo -e "\033[1;33m===============================================\033[0m"
echo -e "\033[1;34m22 Feb. 2019, by dk808, Goose-Tech, & Skyslayer\033[0m"
echo -e
echo -e "\033[1;36mUpdate starting, press [CTRL-C] to cancel.\033[0m"
sleep 3
echo ""

if [ "$USERNAME" = "root" ]; then
    echo -e "\033[1;36mYou are currently logged in as \033[0mroot\033[1;36m, please log out and\nlog back in with the username you created for your node.\033[0m"
    exit
fi

USERNAME=$(who -m | awk '{print $1;}')
echo -e "\033[1;36mYou are currently logged in as \033[0m$USERNAME\033[1;36m.\n\n"
read -p 'Was this username used to install the node? [Y/n] ' -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo ""
    echo -e "\033[1;33mPlease log out and login with the username you created for your node.\033[0m"
      exit 1
fi

cd /home/$USERNAME
echo -e "\033[1;36mStopping ZelNode daemon...\033[0m"
sudo systemctl stop zelcash &> /dev/null
for (( counter=15; counter>0; counter-- ))
do
echo -n ". "
sleep 1
done
printf "\n"
echo -e "\033[1;36mPerforming updates...\033[0m"
sudo rm zelcash-gtest &> /dev/null
sudo mv zelcash-tx /usr/bin &> /dev/null
sudo chmod 755 /usr/bin/zelcash-tx
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME
rm ~/plu.sh

echo -e "\033[1;32mUpdate complete. Please reboot the VPS by typing: \033[0msudo reboot -n\033[1;32m."
echo -e "Then verify the node has started by typing: \033[0msudo zelcash-cli getinfo\033[1;32m."
