# Docker Compose for Kiotlog

## Running locally

1.  Create a directory tree for containers' persistent data and starting configuration:

        [Dockerfiles]$ export COMPOSE_ROOT=<path to your base directory>
        [Dockerfiles]$ ./build-persistent-rootfs.sh "$COMPOSE_ROOT"

    Please, note that `${COMPOSE_ROOT}` will be automatically substituted in `docker-compose.local.yml` file. When missing will default to `~/Build/srv/lib`.

2.  Build Kiotlog microservices images:

    Please, follow istructions at [Kiotlog](https://github.com/kiotlog/kiotlog).

3.  Build Postgres image with Kiotlog DB schema

        [Dockerfiles]$ docker-compose build catalog

4.  Download and load [EMQ](http://emqtt.io) MQTT server Docker image

        [Dockerfiles]$ curl -fsSLo emqttd-docker.zip http://emqtt.io/downloads/latest/docker
        [Dockerfiles]$ unzip -p emqttd-docker.zip | docker image load

5.  Run docker-compose

        [Dockerfiles]$ docker-compose -p <project name> -f docker-compose.local.yml up -d
        [Dockerfiles]$ docker-compose -p <project name> -f docker-compose.local.yml ps
        [Dockerfiles]$ docker-compose -p <project name> -f docker-compose.local.yml top
        [Dockerfiles]$ docker-compose -p <project name> -f docker-compose.local.yml logs -f
