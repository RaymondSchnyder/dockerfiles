FROM xataz/alpine:3.5
MAINTAINER xataz <https://github.com/xataz>

ARG MONIT_VER=5.20.0
ARG BUILD_CORES

LABEL description="Monit based on alpine" \
      tags="latest stable 5.20.0 5.20 5" \
      build_ver="2017020101"

ENV USER_MONIT="monit" \
    USER_PASSWORD="monit"

RUN export BUILD_DEPS="wget \
                    ca-certificates \
                    build-base \
                    linux-pam-dev \
                    libressl-dev \
                    bash \
                    zlib-dev \
                    libseccomp-dev@mainedge" \
    && echo "@comuedge http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
    && echo "@mainedge http://dl-4.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories \
    && apk upgrade -U \
    && apk add ${BUILD_DEPS} \
                    linux-pam \
                    docker@comuedge \
                    bash \
                    libseccomp@mainedge \
                    tini \
                    libressl \
                    libcrypto1.0 \
                    libssl1.0 \
    && NB_CORES=${BUILD_CORES-$(grep -c "processor" /proc/cpuinfo)} \
    && cd /tmp \
    && wget https://mmonit.com/monit/dist/monit-${MONIT_VER}.tar.gz \
    && tar xzf monit-${MONIT_VER}.tar.gz \
    && cd /tmp/monit-${MONIT_VER} \
    && ./configure \
    && make -j ${NB_CORES} \
    && make install \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*
    
COPY rootfs /
RUN chmod 700 /etc/monit/monitrc \
    && chmod +x /usr/local/bin/*

CMD ["/usr/local/bin/startup"]
