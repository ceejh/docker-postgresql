FROM ubuntu:14.04
MAINTAINER sameer@damagehead.com

# Don't run in interactive mode
# Removes "TERM is not set, so the dialog frontend is not usable." error
ENV DEBIAN_FRONTEND noninteractive

# Based on https://wiki.postgresql.org/wiki/Apt
RUN apt-get update \
 && apt-get install -y wget \
 && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main 9.4" > /etc/apt/sources.list.d/pgdg.list' \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
 && apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 pwgen \
 && rm -rf /var/lib/postgresql \
 && rm -rf /var/lib/apt/lists/* # 20141001

# Copy over the start script and make it executable
ADD start /start
RUN chmod 755 /start

EXPOSE 5432

VOLUME ["/var/lib/postgresql"]
VOLUME ["/run/postgresql"]

CMD ["/start"]
