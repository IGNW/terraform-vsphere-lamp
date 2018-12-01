#!/bin/bash

LOGFILE=/tmp/terraform.log

function timestamp {
  echo $(date "+%F %T")
}

function info {
  echo "$(timestamp) INFO:  $1" | tee -a "${LOGFILE}"
}

function error {
  echo "$(timestamp) ERROR: $1" | tee -a "${LOGFILE}"
}

info "VM created by Terraform"
MY_IP=$(/sbin/ip -f inet addr show dev ens160 | grep -Po 'inet \K[\d.]+')
info "My IP address is ${MY_IP}"

info "Installing Apache Webserver"
sudo apt-get -y update
sudo apt-get -y install apache2
echo "ServerName ${MY_IP}" | sudo tee -a /etc/apache2/apache2.conf
sudo apache2ctl configtest | tee -a "${LOGFILE}"
sudo systemctl restart apache2 | tee -a "${LOGFILE}"
sudo ufw allow in "Apache Full" | tee -a "${LOGFILE}"
