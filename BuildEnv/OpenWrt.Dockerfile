FROM ubuntu:18.04
LABEL MAINTAINER="august.icekimo@gmail.com"
LABEL description="Build Enviroment for OpenWrt "

# Install Build Packages
RUN apt-get update && apt-get install -y \
   sudo time git-core subversion build-essential gcc-multilib quilt rsync \
   libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python default-jdk \
    git-lfs vim  &&\
    apt-get clean