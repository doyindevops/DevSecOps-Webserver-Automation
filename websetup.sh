#!/bin/bash

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum update -y > /dev/null
sudo yum install wget unzip httpd -y > /dev/null

# Creating Temp Directory 
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip > /dev/null
unzip 2133_moso_interior.zip  > /dev/null
sudo cp -r 2133_moso_interior/* /var/www/html/

# Bounce Service
echo "########################################"
echo "Restarting Apache Webserver service"
echo "########################################"
sudo systemctl restart httpd

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
sudo rm -rf /tmp/webfiles
