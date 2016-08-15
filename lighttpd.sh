#!/usr/bin/zsh
# Start lighttpd

if [[ ! -d 'logs' ]]; then mkdir logs; fi

lighttpd -f lighttpd.conf -D
