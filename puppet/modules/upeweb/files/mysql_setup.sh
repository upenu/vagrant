#!/usr/bin/env bash
# Create a database and user for the UPE website

mysql -u root --password=root -e "CREATE DATABASE upe;"
mysql -u root --password=root -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'littlewhale';"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';"
mysql -u root --password=root -e "FLUSH PRIVILEGES;"