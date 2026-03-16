#!/bin/bash
start_xrdp_services() {
    # Preventing xrdp startup failure
    rm -rf /var/run/xrdp-sesman.pid
    rm -rf /var/run/xrdp.pid
    rm -rf /var/run/xrdp/xrdp-sesman.pid
    rm -rf /var/run/xrdp/xrdp.pid

    # Use exec ... to forward SIGNAL to child processes
    xrdp-sesman
    exec xrdp -n
}

stop_xrdp_services() {
    xrdp --kill
    xrdp-sesman --kill
    exit 0
}

if [ -n "$USER" -a -n "$USER_PASS" -a -n "$SUDO_USER" ]; then
    useradd -m -s /bin/bash $USER
    echo $USER:$USER_PASS | chpasswd
    if [[ $SUDO_USER == "yes" ]]; then
        usermod -aG sudo $USER
    fi
    echo 'exec openbox-session' >> /home/$USER/.xinitrc
fi

echo -e "starting xrdp services...\n"

trap "stop_xrdp_services" SIGKILL SIGTERM SIGHUP SIGINT EXIT
start_xrdp_services
exec "$@"
