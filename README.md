# vagrant
setup information and scripts to get a local dev environment running in a VM

*NOTE:* This is purely for local development and needs heavy modifications to configure a production environment.

## Setup Instructions (Windows and OS X)

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

## Setup Instructions (Linux)

If steps 1 and 2 for Windows/OS X work on Linux, follow the instructions above. On certain Linux systems VirtualBox may not install properly due to kernel version mismatch and other issues. In that case:

1. Install puppet: `sudo apt-get install puppet`
2. Install puppet's vcsrepo module: `sudo puppet module install puppetlabs/vcsrepo`
3. Move manifests directory into `/etc/puppet/manifests`: `sudo mv ./puppet/manifests/* /etc/puppet/manifests/` (Assuming current directory is the vagrant repo)
4. Move modules into `/etc/puppet/modules`: `sudo mv ./puppet/modules/* /etc/puppet/modules/`
5. `cd /etc/puppet/modules/upeweb/files` and `sudo vim venv_setup.sh`
6. Replace `HOMEDIR` with the home directory of your username (type `whoami` in console to find out)
7. Optional: change `WEBDIR` to your desired path.
8. Save the changes and then `cd ../manifests`, then `sudo vim init.pp`
9. Replace `$cmd_user` with your username.
10. Replace `$cmd_group` with your group. You can find this by typing in console `groups`. Use somthing like `users` or your username.
11. Replace `$homedir` and `$webdir` to values you modified in steps 6,7.
12. Save the changes and `cd /etc/puppet`
13. Run `sudo puppet apply /etc/puppet/manifests/default.pp`
14. A bunch out text will be output to the screen. The setup is complete if you see something like `Notice: Finished catalog run in n seconds`.
