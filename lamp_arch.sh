#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install Apache web server
echo "Installing Apache..."
sudo pacman -S apache --noconfirm

# Enable Apache modules
sudo sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/' /etc/httpd/conf/httpd.conf
sudo systemctl enable httpd
sudo systemctl restart httpd

# Install MariaDB (MySQL)
echo "Installing MariaDB..."
sudo pacman -S mariadb --noconfirm

# Initialize MariaDB data directory
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Start and secure MariaDB
sudo systemctl enable mariadb
sudo systemctl start mariadb
echo "Securing MariaDB installation..."
sudo mysql_secure_installation

# Install PHP and required modules
echo "Installing PHP and common modules..."
sudo pacman -S php php-apache php-gd php-imap php-intl php-mcrypt php-sqlite php-xmlrpc --noconfirm

# Configure PHP with Apache
echo "Configuring PHP with Apache..."
sudo sed -i 's/#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/' /etc/httpd/conf/httpd.conf
sudo sed -i 's/LoadModule mpm_event_module/#LoadModule mpm_event_module/' /etc/httpd/conf/httpd.conf

# Add PHP configuration to Apache
echo -e "\n# PHP Configuration\nLoadModule php_module modules/libphp.so\nAddHandler php-script .php\nInclude conf/extra/php_module.conf" | sudo tee -a /etc/httpd/conf/httpd.conf

# Create info.php file to test PHP
echo "Creating PHP info page..."
echo "<?php phpinfo(); ?>" | sudo tee /srv/http/info.php

# Set proper permissions
echo "Setting permissions..."
sudo chown -R http:http /srv/http/
sudo chmod -R 755 /srv/http/

# Restart Apache
echo "Restarting Apache..."
sudo systemctl restart httpd

# Print status
echo "LAMP installation completed!"
echo "Apache status:"
sudo systemctl status httpd | grep Active
echo "MariaDB status:"
sudo systemctl status mariadb | grep Active
echo "PHP version:"
php -v

echo "You can test PHP by visiting: http://localhost/info.php"
sudo rm /srv/http/info.php
