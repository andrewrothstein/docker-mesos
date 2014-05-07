## Mesos Dockerfile


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download from public [Docker Registry](https://index.docker.io/): `docker pull andrewrothstein/docker-mesos`

   (alternatively, you can build an image from Dockerfile: `docker build -t="andrewrothstein/docker-mesos" github.com/andrewrothstein/docker-mesos`)


### Usage

    docker run -d -p 8888:8888 andrewrothstein/typesafe-activator
