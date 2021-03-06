# infra
Infrastructure repository

Contains next scripts:
 - `install_ruby.sh` installs ruby and bundler
 - `install_mongodb.sh` installs mongodb
 - `deploy.sh` deploy simple application
 - `startup.sh` used by gcloud and includes three previous scripts

Command for create GC instance:
`gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup.sh reddit-app`

# Packer
To build images the following command should be executed: `packer build PATH_TO_TEMPLATE`. The command should be runed from root of the repository. For example `PATH_TO_TEMPLATE` could be `packer/app.json`.
 
List of required variables:
 - project_id
 - source_image_family

# Terraform
To init repository use the following command: `terraform init`
For using backends simply run the next command: `terraform init -backend-config=PATH` where is the PATH defines path to backend config. Example of backend config for GCS placed inside `backend.tf.example` files.

To create instances using Terraform use the following command: `terraform apply`
`apply` command should be called inside the directories: `./terraform/<environment>`
For this moment the following `environment` availbale:
 - prod
 - stage

# Ansible
For more information about how to use and configure dynamic inventory use following links:
http://docs.ansible.com/ansible/latest/intro_dynamic_inventory.html
http://docs.ansible.com/ansible/latest/guide_gce.html

It is highly recommended to use virtual environment when u a working with ansible. For more information use the following link: http://docs.python-guide.org/en/latest/dev/virtualenvs/

For apply playbooks to hosts with already installed mongod and ruby with bundler use following command: 
`ansible-playbook site.yml --skip-tags "install,ruby"`
