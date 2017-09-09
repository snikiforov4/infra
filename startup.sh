#!/bin/bash
sudo -u appuser git clone https://github.com/snikiforov4/infra infra
sudo su - appuser -c "bash ~/infra/install_ruby.sh"
sudo su - appuser -c "bash ~/infra/install_mongodb.sh"
sudo su - appuser -c "bash ~/infra/deploy.sh"