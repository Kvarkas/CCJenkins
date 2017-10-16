#!/bin/bash
yum update -y
yum install httpd
mkdir -p /var/www/html/example.com/{public_html,logs}
systemctl enable httpd.service
systemctl restart httpd.service
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload
