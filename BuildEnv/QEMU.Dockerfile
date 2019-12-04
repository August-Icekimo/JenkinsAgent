FROM ubuntu:18.04
LABEL MAINTAINER =august.icekimo@gmail.com
LABEL description="Build Enviroment for "

# Install Build Packages
RUN apt-get update && apt-get install -y \
  sudo time git-core subversion build-essential gcc-multilib quilt rsync \
  libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python default-jdk \
  git-lfs vim  git-email libaio-dev libbluetooth-dev libbrlapi-dev libbz2-dev \
  libcap-dev libcap-ng-dev libcurl4-gnutls-dev libgtk-3-dev \
  libibverbs-dev libjpeg8-dev libncurses5-dev libnuma-dev \
  librbd-dev librdmacm-dev \
  libsasl2-dev libsdl1.2-dev libseccomp-dev libsnappy-dev libssh2-1-dev \
  libvde-dev libvdeplug-dev libvte-2.90-dev libxen-dev liblzo2-dev \
  valgrind xfslibs-dev  &&\
    apt-get clean