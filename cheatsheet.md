# Useful commands for UPE dev box

## Vagrant commands

* `vagrant up`: Boots the machine (or creates the VM if not already there). Make sure you `cd` into the vagrant repo (`Vagrantfile` shows up when you `ls`).

* `vagrant provision`: Run the provisioner (no need to run this usually)

* `vagrant halt`: Shut down the VM

* `vagrant destroy`: Deletes the VM and everything inside. **Only run this if you need to reinstall the VM**.

## Website related commands

* `. ~/venv/bin/activate`: Activates the virtualenv

* `pip install -r ~/upedev/website/requirements.txt`: Installs all packages needed by the UPE website

* `python manage.py syncdb`: Run when first setting up website, and whenever you modify the models. Applies changes to database for you.

* `python manage.py migrate`: Run when changing model. Modifies database for you.

* `python manage.py runserver 0.0.0.0:8000`: Run website locally on port 80. The 0.0.0.0 is there to allow access from outside localhost such as the host OS.


## After modifying files

1. `python manage.py collectstatic`: Updates static files (HTML, JS, CSS etc).

2. `python manage.py migrate`: Migrates models

3. `python manage.py runserver 0.0.0.0:8000`
