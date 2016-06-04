
panel_config:
  file.managed:
    - name: /home/pi/.config/lxpanel/LXDE-pi/panels/panel
    - source: salt://desktop/panel
    - user: pi

desktop_image:
  file.managed:
    - name: /home/pi/Pictures/nodebot.svg
    - source: salt://desktop/nodebot.svg
    - user: pi

desktop_conf:
  file.managed:
    - name: /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
    - source: salt://desktop/desktop-items-0.conf
    - user: pi


