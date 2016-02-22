#!/usr/bin/env bash

apt-get update
apt-get install -y python3 python3-dev python3-pip git
apt-get install -y postgresql-server-dev-all pgadmin3 postgresql postgresql-client
mkdir upe
cd upe
git clone https://github.com/upenu/website.git
cd website
pip3 install virtualenv
virtualenv --python=/usr/bin/python3 venv
source venv/bin/activate
pip3 install -r requirements.txt
sudo su postgres -c 'psql -f /vagrant/db_setup.sql'

