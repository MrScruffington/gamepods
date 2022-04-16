##- Download the latest version of Fedora as a base
FROM registry.fedoraproject.org/fedora:latest

##- Update the container
RUN dnf update -y

##- Install dependencies
RUN dnf install -y glibc.i686 libstdc++.i686 ncurses-libs.i686 ncurses-compat-libs.i686 libcurl.i686

##- This fixes an issue with tf2 complaining about the replay_svr.so
RUN ln -s /usr/lib/libcurl.so.4 /usr/lib/libcurl-gnutls.so.4

##- Create user
RUN useradd -m tf2

##-Mount Point
VOLUME "/srv"

##- Download steamcmd
RUN mkdir -p /srv/steamcmd
RUN curl -o /srv/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xzvf /srv/steamcmd_linux.tar.gz -C /srv/steamcmd
RUN rm -f /srv/steamcmd_linux.tar.gz

##- Update steamcmd
RUN bash /srv/steamcmd/steamcmd.sh +quit

##- Install TF2 Dedicated Server
RUN mkdir -p /srv/tf2
RUN bash /srv/steamcmd/steamcmd.sh +force_install_dir /srv/tf2 +login anonymous +app_update 232250 +quit

##- Change ownership of the tf2 and steamcmd files
RUN chown -R tf2:tf2 /srv/*

##- Copy config files
COPY --chown=tf2 config/mapcycle.txt /srv/tf2/tf/cfg/
COPY --chown=tf2 config/motd.txt /srv/tf2/tf/cfg/
COPY --chown=tf2 config/server.cfg /srv/tf2/tf/cfg/
COPY --chown=tf2 config/tf2_server.sh /srv/
RUN chmod +x /srv/tf2_server.sh

##- Fix weird bug(?) with steamcmd
USER tf2
RUN mkdir -p /home/tf2/.steam/sdk32
RUN ln -s /srv/steamcmd/linux32/steamclient.so /home/tf2/.steam/sdk32

##- Start server using init script
CMD ["/bin/bash","/srv/tf2_server.sh"]
