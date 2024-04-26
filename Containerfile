FROM ubuntu:20.04
RUN apt-get update &&\
▎   apt-get install -y wget &&\
▎   wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y ./gitkraken-amd64.deb
