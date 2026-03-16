FROM debian:12.13

ENV DEBIAN_FRONTEND=noninteractive

RUN <<EOF
apt-get update
apt-get upgrade -y
apt-get install -y \
    gosu \
    sudo \
    tigervnc-standalone-server \
    tigervnc-common \
    openbox \
    stterm
EOF

RUN <<EOF
apt-get install -y \
    surf
rm -rf /var/lib/apt/lists/*
EOF

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh


EXPOSE 5901

ENTRYPOINT ["/entrypoint.sh"]
