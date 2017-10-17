#!/bin/bash
sudo yum update -y
sudo yum install httpd
sudo mkdir -p /var/www/html/example.com/{public_html,logs}
sudo systemctl enable httpd.service
sudo systemctl restart httpd.service
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --zone=public --permanent --add-service=https
sudo firewall-cmd --reload
EOF
