Pre-requisites
Jenkins, Packer, Terraform and Ansible should be installed.

For Terraform to work for AWS

Configuring the AWS CLI

aws configure --profile qa
aws configure --profile staging

packer build /packer/packer-ubuntu-apache2-php.json

