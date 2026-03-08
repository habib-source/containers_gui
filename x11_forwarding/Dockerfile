FROM debian:12.13

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade  -y && apt-get install -y \
    gedit \
    && rm -rf /var/lib/apt/lists/*

# Run as non-root for security
RUN useradd -m appuser
USER appuser

CMD ["gedit"]
