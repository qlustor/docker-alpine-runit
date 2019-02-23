#BUILDS qlustor/alpine-runit

FROM gliderlabs/alpine:3.8
MAINTAINER Team QLUSTOR <team@qlustor.com>

# Install runit
RUN apk-install --update ca-certificates                \
 && update-ca-certificates                              \
 && apk-install runit

# Install runit-docker  --  Credits to https://github.com/pixers/runit-docker
ADD . /

ENTRYPOINT ["/sbin/runit-docker"]

