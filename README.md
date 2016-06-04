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
* installs:
    * iceweasel
    * git
* sets local timezone
* sets AU locale and US keyboard layout

* Installs nvm and then installs node 6
* Deploy the robotnik package to the pi user folder
* Installs npm dependencies

