# vagrant
setup information and scripts to get a local dev environment running in a VM

*NOTE:* This is purely for local development and needs heavy modifications to configure a production environment.

## Setup Instructions

1. Install the appropriate version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your system.
2. Install the appropriate version of [Vagrant](http://www.vagrantup.com/downloads.html)
3. In your BIOS, make sure that Intel Virtualization Technology is enabled.
4. Clone this repository. On Windows command prompt can be used.
5. Open Terminal (or Command Prompt on Windows) and cd into the repository directory.
6. Run `vagrant up` and `vagrant provision`
7. SSH to `localhost:20022`. The login username and password are both `vagrant`.
8. cd to the `website` directory and enter virtualenv: `source ./venv/bin/activate`.
9. Follow the website setup instructions in [Final Stretch: Getting Django to run](https://github.com/upenu/website#final-stretch-getting-django-to-run).
10. Access the website at `localhost:20080`. If this does not work, you can also use `192.168.55.55:8000` You should now see the UPE website locally!
11. Wrapping up: you can do Ctrl-C to stop the server, and then run `deactivate` in the terminal to stop the virtualenv.
