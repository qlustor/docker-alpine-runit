#BUILDS qlustor/alpine-runit

FROM gliderlabs/alpine:3.4
MAINTAINER Team QLUSTOR <team@qlustor.com>

# Install runit
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >>/etc/apk/repositories \
 && apk-install --update ca-certificates                \
 && update-ca-certificates                              \
 && apk-install runit

# Install runit-docker  --  Credits to https://github.com/pixers/runit-docker
ADD . /

ENTRYPOINT ["/sbin/runit-docker"]

