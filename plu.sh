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
echo -e "\033[1;36mYou are currently logged in as \033[0m$USERNAME\033[1;36m.\033[0m"
read -p 'Was this username used to install the node? [Y/n] ' -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
    echo ""
    read -p 'Please enter the correct username, then hit [ENTER]: ' UNAME
      if [ -z "$UNAME" ]; then
      echo -e "Please enter a valid username or login as the correct user."
      exit 1
      else
      USERNAME=$UNAME
      fi
fi

cd /home/$USERNAME
echo -e "\033[1;34mMaking updates...\033[0m"
sudo rm zelcash-gtest &> /dev/null
sudo mv zelcash-tx /usr/bin &> /dev/null
sudo chmod 755 /usr/bin/zelcash-tx
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME
rm plu.sh

echo -e "\033[1;32mUpdate complete.\033[0m"
