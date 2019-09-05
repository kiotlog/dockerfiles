# Docker Compose for Kiotlog

## Running Kiotlog microservices

1. Clone repository

        git clone https://github.com/kiotlog/dockerfiles

2. Run docker-compose

        docker-compose up -d
        docker-compose ps
        docker-compose top
        docker-compose logs -f

Please, note that default `docker-compose.yml` will create plain persistent volumes. If you wish to persist data (**recommended**) on local filesystem, please refer to `examples/docker-compose.storage-bind.yml`.
