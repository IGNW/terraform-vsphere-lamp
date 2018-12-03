#!/bin/bash

LOGFILE=/tmp/terraform.log

function timestamp {
  echo $(date "+%F %T")
}

function info {
  echo "$(timestamp) INFO:  $1" | tee -a "$${LOGFILE}"
}

function error {
  echo "$(timestamp) ERROR: $1" | tee -a "$${LOGFILE}"
}

info "VM created by Terraform"
IP_ADDRESS=$(/sbin/ip -f inet addr show dev ens160 | grep -Po 'inet \K[\d.]+')
info "My IP address is $${IP_ADDRESS}"

info "Installing Apache Webserver"
sudo apt-get -y update
sudo apt-get -y install apache2
echo "ServerName $${IP_ADDRESS}" | sudo tee -a /etc/apache2/apache2.conf
sudo apache2ctl configtest | tee -a "$${LOGFILE}"
sudo systemctl restart apache2 | tee -a "$${LOGFILE}"
sudo ufw allow in "Apache Full" | tee -a "$${LOGFILE}"

info "Installing MySQL"
sudo DEBIAN_FRONTEND=noninteractive apt-get -q -y install mysql-server
sudo mysql --user=root <<_EOF_
  UPDATE mysql.user SET Authentication_string=PASSWORD('${mysql_root_password}') WHERE User='root';
  DELETE FROM mysql.user WHERE User='';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
  DROP DATABASE IF EXISTS test;
  DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
  FLUSH PRIVILEGES;
_EOF_
