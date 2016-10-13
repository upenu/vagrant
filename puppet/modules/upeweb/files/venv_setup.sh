#!/usr/bin/env bash
# Sets up virtualenv in the UPE website directory
# and installs dependent packages.

HOMEDIR = /home/vagrant
WEBDIR=$HOMEDIR/website

cd $WEBDIR
virtualenv --python=/usr/bin/python3 venv
source venv/bin/activate
pip3 install -r requirements.txt

# Prevents puppet from running more than once
touch /home/vagrant/.venvsetupdone
