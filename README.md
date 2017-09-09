# infra
Infrastructure repository

Contains next scripts:
 - `install_ruby.sh` installs ruby and bundler
 - `install_mongodb.sh` installs mongodb
 - `deploy.sh` deploy simple application
 - `startup.sh` used by gcloud and includes three previous scripts

Command for create GC instance:
`gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup.sh reddit-app`