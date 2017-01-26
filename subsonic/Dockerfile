# Fork from https://github.com/wonderfall/dockerfiles/subsonic

FROM xataz/alpine:3.5
MAINTAINER xataz <https://github.com/xataz/dockerfiles>

ARG SUBSONIC_VER=6.0

LABEL description="Open source media streamer" \
      tags="latest 6.0 6" \
      build_ver="2017012601"

ENV UID=991 \
    GID=991 \
    WEBROOT=/ \
    MUSICS_FOLDER=/data/musics \
    PODCASTS_FOLDER=/data/podcasts \
    PLAYLISTS_FOLDER=/data/playlists

WORKDIR /subsonic

RUN apk -U add \
        ffmpeg \
        su-exec \
        openjdk8-jre \
        tini \
        libressl \
        ca-certificates \
    && wget http://subsonic.org/download/subsonic-${SUBSONIC_VER}-standalone.tar.gz \
    && tar xzvf subsonic-${SUBSONIC_VER}-standalone.tar.gz \
    && rm -f /var/cache/apk/* subsonic-${VERSION}-standalone.tar.gz

COPY startup /usr/local/bin/startup

RUN chmod +x /usr/local/bin/startup

EXPOSE 4040 4050

VOLUME /data /config

ENTRYPOINT ["/usr/local/bin/startup"]