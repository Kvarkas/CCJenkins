#!/bin/bash
. /usr/local/osmosix/service/utils/agent_util.sh
agentSendLogMessage "SCRIPT MESSAGE: Start deploy routine..."
cd /var/www/html/example.com/public_html && curl -O 'https://raw.githubusercontent.com/Kvarkas/CCJenkins/master/index.html'
agentSendLogMessage "SCRIPT MESSAGE: Deploy has been completed"
