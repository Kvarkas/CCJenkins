#!/bin/bash
. /usr/local/osmosix/service/utils/agent_util.sh
agentSendLogMessage "SCRIPT MESSAGE: update to the last"
sudo yum update -y
agentSendLogMessage "SCRIPT MESSAGE: Install apache"
sudo yum install httpd -y
sudo systemctl enable httpd.service
sudo systemctl restart httpd.service
agentSendLogMessage "SCRIPT MESSAGE: Create demo vhost"
sudo mkdir -p /var/www/html/example.com/{public_html,logs}
agentSendLogMessage "SCRIPT MESSAGE: Enable http and https protocols"
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --zone=public --permanent --add-service=https
sudo firewall-cmd --reload
agentSendLogMessage "SCRIPT MESSAGE: Node setup completed"

agentSendLogMessage "SCRIPT MESSAGE: Start deploy routine..."
sudo cd /var/www/html/example.com/public_html && sudo curl -O 'https://raw.githubusercontent.com/Kvarkas/CCJenkins/master/index.html'
agentSendLogMessage "SCRIPT MESSAGE: Deploy has been completed"
