# Installs and removes the various common packages needed

{% set host = grains['host'] %}

core-items:
  pkg.installed:
    - names:
      - vim
      - iceweasel
      - git

remove-redundant:
  pkg.removed:
    - names:
      - bluej
      - geany
      - greenfoot
      - nodejs
      - sonic-pi
      - scratch
      - wolfram-engine
      - mathematica

au_locale:
  locale.present:
    - name: en_AU.UTF-8

default_locale:
  locale.system:
    - name: en_AU.UTF-8
    - require:
      - locale: au_locale

kbd:
  keyboard.system:
    - name: us

Australia/Melbourne:
  timezone.system

/home/pi/.vimrc:
  file.managed:
    - source: salt://common/vimrc
    - replace: false
    - user: pi
    - group: pi

{% set bt_host_pillar = 'bluetooth:macs:' + host %}
{% if salt['pillar.get'](bt_host_pillar) %}
{%    set bt_mac = pillar['bluetooth']['macs'][host] %}
{% else %}
{%    set bt_mac = "" %}
{% endif %}

/etc/rc.local:
  file.managed:
    - source: salt://common/rc.local
    - replace: true
    - user: root
    - template: jinja
    - context:
      bt_mac: {{ bt_mac }}
      host: {{ host }}
