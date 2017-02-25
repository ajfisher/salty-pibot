{% set node_version = 6.9 %}
nvm-deps:
  pkg.installed:
    - names:
      - git
      - wget

install_nvm:
  cmd:
    - run
    - name: wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
    - unless: test -d /home/pi/.nvm
    - user: pi
    - require:
      - pkg: nvm-deps

bash_sourcing:
  file.append:
    - name: /home/pi/.bashrc
    - text:
      - export NVM_DIR="$HOME/.nvm"
      - '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
      - export PATH=./node_modules/.bin/:$PATH
    - require:
      - cmd: install_nvm

install_node:
  cmd:
    - run
    - name: /bin/bash -c "source ~/.nvm/nvm.sh; nvm install {{ node_version }} && nvm alias default {{ node_version }} && nvm use {{ node_version }}"
    - onlyif: /bin/bash -c "source ~/.nvm/nvm.sh; nvm ls {{ node_version }} | grep 'N/A'"
    - user: pi
    - require:
      - cmd: install_nvm
      - file: bash_sourcing
