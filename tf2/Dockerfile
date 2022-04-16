##- Download the latest version of Fedora as a base
FROM registry.fedoraproject.org/fedora

##- Label the container
LABEL maintainer="Scruffington"

##- Update the container
RUN dnf update -y

##- Install dependencies
RUN dnf install -y glibc.i686 libstdc++.i686

##- Download steamcmd
RUN mkdir /srv/steamcmd
RUN curl -o /srv/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xzvf /srv/steamcmd_linux.tar.gz -C /srv/steamcmd

##- Initial run for steamcmd
RUN bash /srv/steamcmd/steamcmd.sh +quit
