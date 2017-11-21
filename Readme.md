# Docker Compose for Kiotlog

## Running locally
### Create persistent rootfs for containers

Create a directory tree for containers' persistent data and starting configuration:

    [Dockerfiles]$ export COMPOSE_ROOT=<path to your base directory>
    [Dockerfiles]$ ./build-persistent-rootfs.sh "$COMPOSE_ROOT"

Please, note that `${COMPOSE_ROOT}` will be automatically substituted in `docker-compose.local.yml` file. When missing will default to `~/Build/srv/lib`.

### Run docker-compose

    [Dockerfiles]$ docker-compose -p <project name> -f docker-compose.local.yml up
