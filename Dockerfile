FROM ubuntu:16.04

RUN apt-get -q update && apt-get -q upgrade -y && \
    apt-get -q install -y curl wget dnsutils nmap netcat-traditional tcpdump mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD [ "tail", "-F", "-n0", "/etc/hosts" ]
