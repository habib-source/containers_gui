FROM debian:12.13

ENV DEBIAN_FRONTEND=noninteractive

# Install VNC server and desktop environment
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    tigervnc-standalone-server \
    tigervnc-common \
    dbus-x11 \
    openbox \
    stterm

# Install your applications
RUN apt-get install -y \
    gedit \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

# Create user
RUN useradd -m -s /bin/bash vncuser

USER vncuser

WORKDIR /home/vncuser

# VNC startup script
RUN mkdir -p /home/vncuser/.vnc
COPY --chown=vncuser:vncuser xstartup /home/vncuser/.vnc/xstartup
RUN chmod +x /home/vncuser/.vnc/xstartup

EXPOSE 5901

ENTRYPOINT ["/entrypoint.sh"]
CMD ["Vncserver", "-localhost", "no", "-geometry", "1920x1080", "-depth", "24", ":1", "-fg"]
