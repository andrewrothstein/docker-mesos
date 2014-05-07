FROM ubuntu

MAINTAINER andrew.rothstein@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
 software-properties-common \
 build-essential \
 unzip \
 openjdk-6-jdk \
 curl \
 git \
 python-dev \
 python-boto \
 libcurl4-nss-dev \
 libsasl2-dev \
 autoconf \
 libtool

RUN curl http://www.apache.org/dist/mesos/0.18.0/mesos-0.18.0.tar.gz \
    | tar zxvf - -C /opt
RUN ln -s /opt/mesos-0.18.0 /opt/mesos
RUN mkdir /opt/mesos/build
RUN sh -c "cd /opt/mesos/build && ../configure"
RUN sh -c "cd /opt/mesos/build && make"
RUN sh -c "cd /opt/mesos/build && make check"
RUN sh -c "cd /opt/mesos/build && make install"
