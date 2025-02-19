#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Apache
echo "Installing Apache..."
sudo apt-get install apache2 -y

# Install MySQL
echo "Installing MySQL..."
sudo apt-get install mysql-server -y

# Secure MySQL installation
echo "Securing MySQL installation..."
sudo mysql_secure_installation

# Install PHP and necessary modules
echo "Installing PHP and modules..."
sudo apt-get install php libapache2-mod-php php-mysql -y

# Restart Apache to apply changes
echo "Restarting Apache..."
sudo systemctl restart apache2

# Create a MySQL database and user
echo "Setting up MySQL database..."
read -p "Enter a name for the MySQL database: " dbname
read -p "Enter a username for the MySQL database: " dbuser
read -s -p "Enter a password for the MySQL user: " dbpass
echo

# Create the database and user
sudo mysql -e "CREATE DATABASE ${dbname};"
sudo mysql -e "CREATE USER '${dbuser}'@'localhost' IDENTIFIED BY '${dbpass}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${dbuser}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Create a simple PHP web page
echo "Creating a simple PHP web page..."
echo "<?php
echo '<!DOCTYPE html>
<html>
<head>
    <title>Hello, World!</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>Welcome to your new LAMP stack server!</p>
</body>
</html>';
?>" | sudo tee /var/www/html/index.php

# Set permissions for the web directory
echo "Setting permissions for the web directory..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Display completion message
echo "LAMP stack installation and configuration is complete!"
echo "You can access your web page at http://$(curl -s ifconfig.me)/index.php"
