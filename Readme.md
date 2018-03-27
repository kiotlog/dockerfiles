# Docker Compose for Kiotlog

## Running locally

0.  Clone repository
        
        $ git clone https://github.com/kiotlog/dockerfiles
        $ cd dockerfiles

1.  Create a directory tree for containers' persistent data and starting configuration:

        $ export COMPOSE_ROOT=<path to your base directory>
        $ ./build-persistent-rootfs.sh "$COMPOSE_ROOT"

    Please, note that `${COMPOSE_ROOT}` will be automatically substituted in `docker-compose.local.yml` file. When missing will default to `${HOME}/Build/srv/lib`.

2.  Build Kiotlog microservices images:

        $ cd ..
        $ git clone --recurse-submodules http://github.com/kiotlog/kiotlog
        $ cd kiotlog
        $ docker-compose build
        $ cd ..
        $ git clone --recurse-submodules http://github.com/kiotlog/kiotlogweb
        $ cd kiotlogweb
        $ docker-compose build
        $ cd ../dockerfiles

    More info at [Kiotlog](https://github.com/kiotlog/kiotlog).

3.  Build Postgres image with Kiotlog DB schema

        $ docker-compose build catalog

4.  Download and load [EMQ](http://emqtt.io) MQTT server Docker image

        $ curl -fsSLo emqttd-docker.zip http://emqtt.io/downloads/latest/docker
        $ unzip -p emqttd-docker.zip | docker image load

5.  Run docker-compose

        $ docker-compose -p <project name> -f docker-compose.local.yml up -d
        $ docker-compose -p <project name> -f docker-compose.local.yml ps
        $ docker-compose -p <project name> -f docker-compose.local.yml top
        $ docker-compose -p <project name> -f docker-compose.local.yml logs -f
