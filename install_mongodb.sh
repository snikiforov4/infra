#!/bin/bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt-get update
sudo apt-get install -y mongodb-org

sudo systemctl start mongod
sudo systemctl enable mongod

# ln = eval 'sudo systemctl status mongod | grep 'Active: active (running)' | wc -l'
# if [[ $ln -lt 1 ]]; then
# 	echo "Something went wrong the proccess isn't started"
# 	return 1
# fi
