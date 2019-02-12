FROM mongo:3.4
RUN apt-get update
RUN apt-get install -y cron apt-utils tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "Asia/Shanghai" >/etc/timezone && dpkg-reconfigure -f noninteractive tzdata

ADD backup.sh /backup.sh
ADD start.sh /start.sh
RUN chmod +x /start.sh && chmod +x /backup.sh

VOLUME /backup

ENTRYPOINT ["/start.sh"]
