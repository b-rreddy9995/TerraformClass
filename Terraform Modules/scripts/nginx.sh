#! /bin/bash
sudo apt update 
sudo apt install tree -y
sudo apt install nginx -y
sudo service nginx start 
sudo mkdir filecopy
sudo chmod 777 filecopy