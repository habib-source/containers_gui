#!/bin/sh
echo $VNC_PASSWORD | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
exec "$@"
