# Installs and removes the various common packages needed

{% set host = grains['host'] %}

core-items:
  pkg.installed:
    - names:
      - vim
      - iceweasel
      - git
      - screen

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
      - libreoffice
      - libreoffice-core
      - libreoffice-common

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

{% set hostap = False %}
{% if salt['pillar.get']('hostap') %}
{%  set hostap = pillar['hostap'] %}
{% endif %}

/etc/rc.local:
  file.managed:
    - source: salt://common/rc.local
    - replace: true
    - user: root
    - template: jinja
    - context:
      {% if pillar["bluetooth"] is defined %}
      bt_base: "{{ pillar["bluetooth"]["base"] }}"
      bt_mac: {{ bt_mac }}
      {% endif %}
      host: {{ host }}
      hostap: {{ hostap }}
