#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y php libapache2-mod-php php-mysql php-curl php-gd php-json php-zip php-mbstring
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl start apache2
sudo systemctl enable apache2
hostname | sudo tee /var/www/html/index.html
sudo apt-get install -y mysql-server
sudo service mysql start