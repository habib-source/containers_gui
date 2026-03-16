#!/bin/bash
if [ -n "$USER" -a -n "$USER_PASS" -a -n "$SUDO_USER" ]; then
    useradd -m -s /bin/bash $USER
    echo $USER:$USER_PASS | chpasswd
    if [ "$SUDO_USER" -a "yes" ]; then
        usermod -aG sudo $USER
    fi
    mkdir -p /home/$USER/.vnc
    echo 'exec openbox-session' >> /home/$USER/.vnc/xstartup
    chmod +x /home/$USER/.vnc/xstartup
    echo $VNC_PASSWORD | vncpasswd -f > /home/$USER/.vnc/passwd
    chmod 600 /home/$USER/.vnc/passwd
    chown -R $USER /home/$USER/.vnc

fi
gosu $USER vncserver -localhost no -geometry 1920x1080 -depth 24 :1 -fg
exec "$@"
