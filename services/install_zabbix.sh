#!/bin/bash

# Usage: `./install_zabbix.sh`

install_zabbix() {
  wget http://repo.zabbix.com/zabbix/3.2/debian/pool/main/z/zabbix-release/zabbix-release_3.2-1+jessie_all.deb
  sudo dpkg -i zabbix-release_3.2-1+jessie_all.deb
  sudo apt-get update
  rm -f zabbix-release_3.2-1+jessie_all.deb
  sudo apt-get install -y zabbix-agent
  sudo systemctl start zabbix-agent
}

install_zabbix_mysql() {
  sudo apt-get install -y zabbix-server-mysql
  sudo zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -p zabbix
  # TODO: set DBHost, DBName, DBUser, DBPassword in zabbix_server.conf
}

install_zabbix_frontend_php() {
  sudo apt-get install -y zabbix-frontend-php
  sudo a2disconf zabbix
  sudo sed -i 's/# php_value date\.timezone Europe\/Riga/php_value date\.timezone Asia\/Tokyo/g' /etc/apache2/conf-available/zabbix.conf
  sudo a2enconf zabbix
  sudo systemctl start apache2
}

install_zabbix
install_zabbix_mysql
install_zabbix_frontend_php

sudo systemctl restart zabbix-server
