FROM linuxserver/baseimage
MAINTAINER smdion <me@seandion.com>
ENV APTLIST="polipo inotify-tools"

# Install Polipo
RUN \
  apt-get install $APTLIST -qy && \

# clean up 
rm -rf rm -rf /app/.*[a-z] && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# volumes and ports
VOLUME /config
EXPOSE 8123

# adding custom files
ADD services/ /etc/service/
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/service/*/run /etc/service/*/finish && chmod -v +x /etc/my_init.d/*.sh && \