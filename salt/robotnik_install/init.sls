# moved to it's own file as it's pretty hefty
{% set robotnik_path = "/home/pi/dev/robotnik" %}

npm_install:
  cmd:
    - run
    - name: "npm install"
    - cwd: {{ robotnik_path }}
    - user: pi
    - onlyif: test -f {{ robotnik_path }}/package.json

dist_build:
  cmd:
    - run
    - name: "{{ robotnik_path }}/node_modules/.bin/gulp"
    - cwd: {{ robotnik_path }}
    - user: pi
    - require:
      - cmd: npm_install
