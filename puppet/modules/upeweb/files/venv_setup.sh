#!/usr/bin/env bash
# Sets up virtualenv in the UPE website directory
# and installs dependent packages.

HOMEDIR=/home/vagrant
WEBDIR=$HOMEDIR/upedev/website

# Generate virtualenv in home directory.
# In vagrant we sync website directory with host OS, and creating virtualenv
# in synced directory causes issues.

cd $HOMEDIR

virtualenv --python=/usr/bin/python3 venv
source venv/bin/activate
pip3 install -r $WEBDIR/requirements.txt

# Prevents puppet from running more than once
touch $HOMEDIR/.venvsetupdone
