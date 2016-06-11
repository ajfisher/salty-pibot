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

workshop-repo:
  git.latest:
    - name: https://github.com/ajfisher/robotnik-workshop
    - rev: master
    - target: /home/pi/Desktop/workshop
    - user: pi
    - require:
      - pkg: git

workshop-json:
  file.symlink:
    - name: {{ robotnik_path }}/workshops/pwc.json
    - target: /home/pi/Desktop/workshop/workshop/pwc.json
    - user: pi
    - require:
      - git: workshop-repo
      - git: repo

workshop-rebuild:
  cmd.run:
    - cwd: {{ robotnik_path }}
    - user: pi
    - name: "./node_modules/.bin/gulp"
