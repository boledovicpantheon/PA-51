cat > /jobs/config.ini << EOF
[jenkins]
user=admin
password=admin-password
url=http://$JENKINS_PORT_80_TCP_ADDR:$JENKINS_SERVICE_PORT_HTTP
EOF
