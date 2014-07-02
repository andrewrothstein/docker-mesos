FROM ubuntu

MAINTAINER andrew.rothstein@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y zookeeperd default-jre python-setuptools python-protobuf curl

RUN curl -sSfL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.19.0~ubuntu14.04%2B1_amd64.deb --output /tmp/mesos.deb
RUN dpkg -i /tmp/mesos.deb

RUN curl -sSfL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.19.0_rc2-py2.7-linux-x86_64.egg --output /tmp/mesos.egg
RUN easy_install /tmp/mesos.egg
