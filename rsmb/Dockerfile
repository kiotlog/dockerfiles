FROM alpine AS building

MAINTAINER Giampaolo Mancini <giampaolo@trampolineup.com>

RUN apk add --no-cache --update build-base git
RUN git clone https://github.com/eclipse/mosquitto.rsmb \
	&& cd mosquitto.rsmb/rsmb/src \
	&& make broker_mqtts

FROM alpine

COPY broker_mqtts.conf /
COPY --from=building mosquitto.rsmb/rsmb/src/broker_mqtts /
COPY --from=building mosquitto.rsmb/rsmb/src/Messages.1.3.0.2 /
COPY docker-entrypoint.sh /
#ENTRYPOINT ["/broker_mqtts"]
ENTRYPOINT ["./docker-entrypoint.sh"]
#CMD ["/broker_mqtts.conf"]
