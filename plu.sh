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

USERNAME=$(who -m | awk '{print $1;}')

cd /home/$USERNAME
sudo rm zelcash-gtest &> /dev/null
sudo mv zelcash-tx /usr/bin &> /dev/null
sudo chmod 755 /usr/bin/zelcash-tx
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME
rm plu.sh

echo -e "\033[1;32mUpdate complete.\033[0m"
