# used to set up tests for LEDs to make sure
# packages are working

/home/pi/dev/ledtest:
  file.directory:
    - user: pi
    - makedirs: true

/home/pi/dev/ledtest/package.json:
  file.managed:
    - source: salt://ledtest/package.json
    - user: pi

/home/pi/dev/ledtest/led.js:
  file.managed:
    - source: salt://ledtest/led.js
    - user: pi

/home/pi/dev/ledtest/piled.js:
  file.managed:
    - source: salt://ledtest/piled.js
    - user: pi

npm_install:
  cmd:
    - run
    - name: "source ~/.nvm/nvm.sh; npm install"
    - cwd: /home/pi/dev/ledtest
    - user: pi
    - onlyif: test -f /home/pi/dev/ledtest/package.json
    - require:
      - file: /home/pi/dev/ledtest/package.json
      - file: /home/pi/dev/ledtest/led.js
      - file: /home/pi/dev/ledtest/piled.js
