# sets the various elements needed for robotnik

{% set robotnik_path = "/home/pi/dev/robotnik" %}

include:
  - common

/home/pi/dev:
  file.directory:
    - user: pi
    - makedirs: true

repo:
  git.latest:
    - name: https://github.com/ajfisher/robotnik
    - rev: betterUIControls
    - target: {{ robotnik_path }}
    - user: pi
    - require:
      - pkg: git
      - file: /home/pi/dev

readme-repo:
  git.latest:
    - name: https://github.com/ajfisher/robotnik-workshop
    - rev: master
    - target: /home/pi/Desktop/workshop
    - user: pi
    - require:
      - pkg: git

