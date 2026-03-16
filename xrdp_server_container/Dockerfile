FROM debian:12.13

ENV DEBIAN_FRONTEND=noninteractive

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

RUN <<EOF
apt-get install -y \
    surf
rm -rf /var/lib/apt/lists/*
EOF

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
