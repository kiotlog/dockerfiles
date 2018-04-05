# Docker Compose for Kiotlog

## Running storage-volumesly

0.  Clone repository
        
        $ git clone https://github.com/kiotlog/dockerfiles
        $ cd dockerfiles

1.  Build Kiotlog microservices images:

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

2.  Build Postgres image with Kiotlog DB schema

        $ docker-compose build catalog

3.  Download and load [EMQ](http://emqtt.io) MQTT server Docker image

        $ curl -fsSLo emqttd-docker.zip http://emqtt.io/downloads/latest/docker
        $ unzip -p emqttd-docker.zip | docker image load

4.  Run docker-compose

        $ docker-compose up -d
        $ docker-compose ps
        $ docker-compose top
        $ docker-compose logs -f

Please, note that default `docker-compose.yml` will create plain persistent volumes. If you wish to persist data on local filesystem, please refer to `docker-compose.storage-bind.yml`.
