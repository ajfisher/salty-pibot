# salty-pibot
Salt config for managing salt states for RPi NodeBots development

## Minion config

* Put the `wpa_supplicant` file onto the boot partition after dd is finished
* ssh pi@raspberrypi.local to get to machine to configure next steps.
* Update the hostname to not be raspberrypi
* restart (otherwise you'll need to delete the `/etc/salt/minion_id` afterwards
* Install the minion deps.

https://docs.saltstack.com/en/latest/topics/installation/debian.html

```
echo 'deb http://archive.raspbian.org/raspbian/ stretch main' >> /etc/apt/sources.list
echo 'APT::Default-Release "jessie";' > /etc/apt/apt.conf.d/10apt
apt-get update
apt-get install python-zmq python-tornado/stretch salt-common/stretch
apt-get install salt-minion/stretch
```

Bind the minion to the master in /etc/salt/minion as

```
master: themis.local
```

You will have to pair the bluetooth module manually as there's not an easy way
to do this:

```
bluetoothctl
scan on
agent on
pair xx:xx:xx:xx
trust xx:xx:xx:xx
```

Which will then make it permanent

## Master config

Accept keys from minions as required.

## Master commands

* `salt 'nodebots*' state.highstate` will build common elements


## Configuration

* Removes:
    * mathematica
    * wolfram alpha
    * geany
    * sonic
    * scratch
    * libreoffice
    * bluefoot
    * legacy nodejs
    * libreoffice
* installs:
    * iceweasel
    * git
    * nvm
        * nodejs 6
        * sets paths
* sets local timezone
* sets AU locale and US keyboard layout
* deploys robotnik:
    * retrieves remote from git
    * updates to use appropriate branch
	* runs npm to get dependencies
	* runs gulp to produce the distribution files
    * deploys code for the workshop notes
* Sets up desktop
    * adds iceweasel to panel
    * sets nodebots desktop
    * adds server launcher
* Allows GPU memory level to be set appropriately
* deploys test code:
    * led test using specified port
* sets up rc.local:
    * Auto bind the bt device
* sets up host ap routing
    * installs dnsmasq for local dhcp
    * installs hostapd to switch RPi to Host AP mode
    * configures rc.local to detect network and set up host mode

## TODO

* set up deploy of files into robotnik folder
    * run gulp command on completion
