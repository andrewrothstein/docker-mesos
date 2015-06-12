FROM ubuntu:14.04

MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

ENV GIT_VER=master MESOS_BUILD_ROOT=/build/mesos

RUN DEBIAN_FRONTEND=noninteractive \
 apt-get update && \
 apt-get install -yq \
  curl \
  build-essential \
  autoconf \
  libtool \
  zlib1g-dev \
  libcurl4-nss-dev \
  libsasl2-dev \
  openjdk-6-jdk \
  maven \
  python-dev \
  python-boto \
  libsvn-dev \
  libapr1-dev && \
 mkdir -p $MESOS_BUILD_ROOT && \
 cd $MESOS_BUILD_ROOT && \
 (curl -L https://github.com/andrewrothstein/mesos/tarball/${GIT_VER} | tar zx) && \
 ./bootstrap && \
 mkdir -p $MESOS_BUILD_ROOT/build && \
 cd $MESOS_BUILD_ROOT/build && \
 ../configure && make install && \
 rm -rf $MESOS_BUILD_ROOT
