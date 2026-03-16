FROM debian:12.13

ENV DEBIAN_FRONTEND=noninteractive

# Install VNC server and desktop environment
RUN <<EOF
apt-get update
apt-get upgrade -y
apt-get install -y \
    wget \
    xorgxrdp \
    xrdp \
    dbus-x11 \
    openbox \
    sudo \
    stterm
EOF

# Install your applications
RUN <<-EOF
apt-get install -y \
    surf
rm -rf /var/lib/apt/lists/*
EOF

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
CMD ["vncserver", "-localhost", "no", "-geometry", "1920x1080", "-depth", "24", ":1", "-fg"]
