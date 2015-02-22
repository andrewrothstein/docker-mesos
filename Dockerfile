FROM ubuntu:trusty

MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y default-jre python-setuptools python-protobuf curl

RUN curl -sSfL \
 http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.21.1-1.1.ubuntu1404_amd64.deb \
 --output /tmp/mesos.deb \
 && dpkg -i /tmp/mesos.deb \
 && rm -f /tmp/mesos.deb

RUN curl -sSfL \
 http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.19.0_rc2-py2.7-linux-x86_64.egg \
 --output /tmp/mesos.egg \
 && easy_install /tmp/mesos.egg \
 && rm -f /tmp/mesos.egg
