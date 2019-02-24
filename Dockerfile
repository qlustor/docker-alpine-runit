#BUILDS qlustor/alpine-runit

FROM gliderlabs/alpine:3.8
MAINTAINER Team QLUSTOR <team@qlustor.com>

# Install runit-docker  --  Credits to https://github.com/pixers/runit-docker
ADD . /

# Install runit
RUN chmod +x /sbin/runit-docker                         \
 && apk-install --update ca-certificates                \
 && update-ca-certificates                              \
 && apk-install runit

ENTRYPOINT ["/sbin/runit-docker"]

