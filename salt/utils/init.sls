# Used to set specific states when needed using
# salt 'foo' state.sls_id ID utils
# where ID is the id of the salt directive to run

# memory related things

set_high_gpu_mem:
  file.replace:
    - name: /boot/config.txt
    - pattern: ^gpu_mem=.*$
    - repl: gpu_mem=256

set_low_gpu_mem:
  file.replace:
    - name: /boot/config.txt
    - pattern: ^gpu_mem=.*$
    - repl: gpu_mem=16

