# vagrant
setup information and scripts to get a local dev environment running in a VM

this will all change once I figure out how to actually package vagrant boxes

## Setup Instructions

1. Install the appropriate version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your system.
2. Install the appropriate version of [Vagrant](http://www.vagrantup.com/downloads.html)
3. In your BIOS, make srue that Intel Virtualization Technology is enabled.
4. Create a directory called `upe-vagrant` or something and cd into it
5. Enter the following command: `vagrant init ubuntu/trusty64`
6. Replace the contents of the generated `Vagrantfile` with that of the Vagrantfile in this repository; add the files `bootstrap.sh` and `db_setup.sql` to the same directory as well
  1. Feel free to use git to clone the repo to this directory, or to just copy and paste things
7. Run `vagrant up` and `vagrant-provision`
8. Use `vagrant ssh` to login to your VM
9. Navigate into the `upe/website` directory and activate the virtualenv with the command `source venv/bin/activate`
10. Now you are ready to do `python3 manage.py syncdb`
11. If successful, Django should ask you to install superusers. Say yes, and use a one-character username/password for ease.
12. Now you can run `python3 manage.py runserver 0.0.0.0:8000`. This will be your go-to command when you develop.
13. Visit `0.0.0.0:8765` on your desktop in a browser or something. You should now see the UPE website locally!
  - Note that you will have to comment out the ALLOWED_HOSTS variable in `upe/settings.py`. Make sure not to commit changes to settings.py to the repo!
14. Wrapping up: you can do Ctrl-C to stop the server, and then run `deactivate` in the terminal to stop the virtualenv.

