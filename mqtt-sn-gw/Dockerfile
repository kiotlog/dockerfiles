FROM alpine as build

RUN set -ef \
    && apk add --no-cache build-base openssl-dev git \
    && git clone https://github.com/eclipse/paho.mqtt-sn.embedded-c \
    && cd paho.mqtt-sn.embedded-c/MQTTSNGateway \
    && make


FROM alpine

RUN set -ef \
    && apk add --update --no-cache openssl libstdc++

COPY --from=build /paho.mqtt-sn.embedded-c/MQTTSNGateway/Build/MQTT-SNGateway MQTT-SNGateway

ENTRYPOINT [ "./MQTT-SNGateway" ]
