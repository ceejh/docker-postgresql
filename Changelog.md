# Changelog

**9.4**

- changes to ubuntu 14.04 container
- uses [PGDG](https://wiki.postgresql.org/wiki/Apt) to install postgresql
- changes postgresql version from 9.1 to 9.4beta

**9.1-1**

- upgrade to sameersbn/ubuntu:20141001, fixes shellshock
- support creation of users and databases at launch (`docker run`)
- mount volume at `/var/run/postgresql` allowing the postgresql unix socket to be exposed

**9.1**

- optimized image size by removing `/var/lib/apt/lists/*`.
- update to the sameersbn/ubuntu:12.04.20140818 baseimage
- removed use of supervisord
