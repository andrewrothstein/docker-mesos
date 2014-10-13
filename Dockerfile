FROM andrewrothstein/docker-ansible

MAINTAINER andrew.rothstein@gmail.com

ADD playbook.yml .
ADD roles .
RUN ansible-playbook playbook.yml
