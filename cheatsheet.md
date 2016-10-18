# Useful commands for UPE dev box

## Vagrant commands

* `vagrant up`: Boots the machine (or creates the VM if not already there). Make sure you `cd` into the vagrant repo (`Vagrantfile` shows up when you `ls`).

* `vagrant provision`: Run the provisioner (no need to run this usually)

* `vagrant halt`: Shut down the VM

* `vagrant destroy`: Deletes the VM and everything inside. **Only run this if you need to reinstall the VM**.

## Website related commands

* `. ~/venv/bin/activate`: Activates the virtualenv (if virtualenv is installed in different location, change ~ to virtualenv directory)

* `pip3 install -r ~/upedev/website/requirements.txt`: Installs all packages needed by the UPE website

* `python3 manage.py syncdb`: Run when first setting up website, and whenever you modify the models. Applies changes to database for you.

* `python3 manage.py migrate`: Run when changing model. Modifies database for you.

* `python3 manage.py runserver 0.0.0.0:8000`: Run website locally on port 8000. The 0.0.0.0 is there to allow access from outside localhost such as the host OS.


## After making changes to the website

1. `python3 manage.py collectstatic`: Updates static files (HTML, JS, CSS etc).

2. `python3 manage.py migrate`: Migrates models

3. `python3 manage.py runserver 0.0.0.0:8000`

4. If you are using vagrant, you can view the website on your browser at `localhost:20080`. If you followed the Linux instructions, the website can be seen at `localhost:8000`.
