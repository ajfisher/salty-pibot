# used to set up hostap mode selectively if we can't find the network

ap_deps:
  pkg.installed:
    - names:
      - hostapd
      - dnsmasq

ap_manual_start:
  cmd:
    - run
    - name: update-rc.d -f hostapd remove
    - user: root
    - require:
      - pkg: ap_deps

dnsmasq_manual_start:
  cmd:
    - run
    - name: update-rc.d -f dnsmasq remove
    - user: root
    - require:
      - pkg: ap_deps

/etc/default/hostapd:
  file.managed:
    - source: salt://hostap/hostapd

/etc/hostapd/hostapd.conf:
  file.managed:
    - source: salt://hostap/hostapd.conf
    - template: jinja

/etc/dnsmasq.conf:
  file.managed:
    - source: salt://hostap/dnsmasq.conf
