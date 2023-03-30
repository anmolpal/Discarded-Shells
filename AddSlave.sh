#!/bin/sh

yes | sudo apt-get update
yes | sudo apt-get upgrade

cd /usr/local/
jq -c '.slaveIP[]' addSlave.json |
while read i;
do
    echo "$i" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/hadoop-3.2.3/etc/hadoop/workers
    echo "$i" | sed "s/['\"]//g" >> /etc/hosts
    echo "$i" | sed "s/['\"]//g" >> /usr/local/kockpit-tools/spark-3.1.3-bin-hadoop3.2/conf/slaves
done

cd /usr/local/
user=`jq '.user' addSlave.json`
sudo touch SSH.sh
sudo chmod 777 SSH.sh
SSHPassword=`jq '.password' addSlave.json`
cd /usr/local/etc/
sudo touch SSHPassword.txt
sudo chmod 777 SSHPassword.txt
echo $SSHPassword | sed "s/['\"]//g" > SSHPassword.txt
SSHPassword1=`awk 'FNR ==1 {print $1}' /usr/local/etc/SSHPassword.txt`
#sudo apt-get install -y sshpass
cd /usr/local/
jq -c '.slaveIP[]' addSlave.json |
while read i;
do
    #echo "sudo ssh-copy-id -i /home/$user/.ssh/id_rsa.pub $user@$i" | sed "s/['\"]//g" >> SSH.sh
    echo "sudo sshpass -p "$SSHPassword1" ssh-copy-id -o StrictHostKeyChecking=no -i /home/$user/.ssh/id_rsa.pub $user@$i" | sed "s/['\"]//g" >> SSH.sh
done
/bin/bash SSH.sh
sudo rm -rf SSH.sh
sudo service ssh --full-restart
service ssh status
