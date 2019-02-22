#ZelNode Pre-Launch Update for Already Running Nodes
#!/bin/bash

#This script will change owner and group of the working directory of systemctl service for the daemon.
#It will also remove some files that are not needed and also put the zelcash-tx binary to it's right location.

USERNAME=$SUDO_USER

sudo rm zelcash-gtest
sudo mv zelcash-tx /usr/bin
sudo chmod 555 /usr/bin/zelcash-tx
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME
rm prelaunchupdate.sh
