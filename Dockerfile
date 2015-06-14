FROM ubuntu:14.04

MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

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
  libapr1-dev


ENV MESOS_CO_ROOT=/build/mesos GIT_VER=0.22.2.patched GIT_PATH=andrewrothstein-mesos-aa4508a

RUN mkdir -p $MESOS_CO_ROOT
RUN curl -L https://github.com/andrewrothstein/mesos/tarball/${GIT_VER} | tar zx -C $MESOS_CO_ROOT

ENV MESOS_BUILD_ROOT=$MESOS_CO_ROOT/$GIT_PATH
WORKDIR $MESOS_BUILD_ROOT
RUN ./bootstrap

ENV MESOS_BUILD_DIR=$MESOS_BUILD_ROOT/build
RUN mkdir -p $MESOS_BUILD_DIR
WORKDIR $MESOS_BUILD_DIR
RUN ../configure && make install && rm -rf $MESOS_BUILD_ROOT

# export environment
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64

# include libmesos on library path
ENV LD_LIBRARY_PATH /usr/local/lib
