# salty-pibot
Salt config for managing salt states for RPi NodeBots development

## Minion config

* Put the `wpa_supplicant` file onto the boot partition after dd is finished
* Update the hostname to not be raspberrypi
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

## Master config

Accept keys from minions as required.

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
* Sets up desktop
    * adds iceweasel to panel
    * sets nodebots desktop

## Todo

* create shortcut for running server on desktop that:
	* runs webserver
	* launches web browser
* add menu items to the panel
	* server launcher for robotnik
* add hostapd and dnsmasq config
	* include rc.local stuff
* 
