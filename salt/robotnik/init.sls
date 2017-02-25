# sets the various elements needed for robotnik

{% set robotnik_path = "/home/pi/dev/robotnik" %}
{% set workshop_repo_path = "/home/pi/Desktop/workshop" %}

include:
  - common

/home/pi/dev:
  file.directory:
    - user: pi
    - makedirs: true

repo:
  git.latest:
    - name: https://github.com/ajfisher/robotnik
    - rev: 2017-feb-updates
    - target: {{ robotnik_path }}
    - user: pi
    - require:
      - pkg: git
      - file: /home/pi/dev

workshop-repo:
  git.latest:
    - name: https://github.com/ajfisher/robotnik-workshop
    - rev: master
    - target: {{ workshop_repo_path }}
    - user: pi
    - require:
      - pkg: git

workshop-json:
  file.symlink:
    - name: {{ robotnik_path }}/workshops/pwc.json
    - target: {{ workshop_repo_path }}/workshop/pwc.json
    - user: pi
    - require:
      - git: workshop-repo
      - git: repo

workshop_npm_install:
  cmd:
    - run
    - name: "npm install"
    - cwd: {{ workshop_repo_path }}
    - user: pi
    - onlyif: test -f {{ workshop_repo_path }}/package.json
    - require:
      - git: workshop-repo

workshop-rebuild:
  cmd.run:
    - cwd: {{ robotnik_path }}
    - user: pi
    - name: "./node_modules/.bin/gulp"
