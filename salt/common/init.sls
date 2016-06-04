# Installs and removes the various common packages needed

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
