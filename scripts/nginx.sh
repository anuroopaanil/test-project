

#!/usr/bin/bash

# Reload systemd daemon
sudo systemctl daemon-reload

# Remove default Nginx site
sudo rm -f /etc/nginx/sites-enabled/default

# Copy new configuration
sudo cp /home/ubuntu/basicConcepts/nginx/nginx.conf /etc/nginx/sites-available/djangoMLDeployment

# Remove old symbolic link if it exists
sudo rm -f /etc/nginx/sites-enabled/djangoMLDeployment

# Create new symbolic link
sudo ln -s /etc/nginx/sites-available/djangoMLDeployment /etc/nginx/sites-enabled/djangoMLDeployment

# Add www-data user to ubuntu group
sudo gpasswd -a www-data ubuntu

# Test Nginx configuration
sudo nginx -t

# If test passes, restart Nginx
if [ $? -eq 0 ]; then
    sudo systemctl restart nginx
else
    echo "Nginx configuration test failed. Please check your configuration."
    exit 1
fi

#!/bin/bash

LOG_FILE="/var/log/nginx_install.log"
exec > >(tee -i $LOG_FILE)
exec 2>&1

set -e
set -x

echo "Starting nginx installation and setup."

# Update package list and install nginx
sudo apt-get update || { echo "apt-get update failed"; exit 1; }
sudo apt-get install -y nginx || { echo "Nginx installation failed"; exit 1; }

# Enable nginx to start on boot and restart nginx service
sudo systemctl enable nginx || { echo "Failed to enable nginx"; exit 1; }
sudo systemctl restart nginx || { echo "Failed to restart nginx"; exit 1; }

echo "Nginx installation and setup complete."
