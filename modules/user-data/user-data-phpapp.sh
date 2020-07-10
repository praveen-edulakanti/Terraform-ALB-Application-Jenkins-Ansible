#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl start apache2
sudo systemctl enable apache2
hostname | sudo tee /var/www/html/index.html