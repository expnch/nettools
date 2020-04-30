FROM ubuntu:18.04

RUN apt-get -q update && apt-get -q upgrade -y && \
    apt-get -q install -y \
      curl \
      dnsutils \
      mysql-client \
      netcat-traditional \
      nmap \
      nscd \
      tcpdump \
      wget \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    echo '/etc/init.d/nscd restart' >> /usr/local/bin/flushdns &&\
    chmod +x /usr/local/bin/flushdns

CMD [ "tail", "-F", "-n0", "/etc/hosts" ]
