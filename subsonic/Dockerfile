# Fork from https://github.com/wonderfall/dockerfiles/subsonic

FROM xataz/alpine:3.5
MAINTAINER xataz <https://github.com/xataz/dockerfiles>

ARG SUBSONIC_VER=6.0

LABEL description="Open source media streamer" \
      tags="latest 6.0 6" \
      build_ver="2017012401"

ENV UID=991 \
    GID=991 \
    HTTPSPORT=0 \
    WEBROOT=/ \
    MUSICS_FOLDER=/musics \
    PODCASTS_FOLDER=/podcasts \
    PLAYLISTS_FOLDER=/playlists

WORKDIR /subsonic

RUN apk -U add \
    ffmpeg \
    su-exec \
    openjdk8-jre \
    tini \
    libressl \
    ca-certificates \
    curl \
 && curl http://subsonic.org/download/subsonic-${SUBSONIC_VER}-standalone.tar.gz > subsonic-${SUBSONIC_VER}-standalone.tar.gz \
 && tar xzvf subsonic-${VERSION}-standalone.tar.gz \
 && rm -f /var/cache/apk/* subsonic-${VERSION}-standalone.tar.gz

COPY startup /usr/local/bin/startup

RUN chmod +x /usr/local/bin/startup

EXPOSE 4040 4050

VOLUME /data /musics /playlists /podcasts

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["java", "-Xmx256m", "-Dsubsonic.home=/data", "-Dsubsonic.host=0.0.0.0", "-Dsubsonic.port=4040", "-Dsubsonic.httpsPort=${HTTPSPORT}", "-Dsubsonic.contextPath=${WEBROOT}", "-Dsubsonic.defaultMusicFolder=${MUSICS_FOLDER}", "-Dsubsonic.defaultPodcastFolder=${PODCASTS_FOLDER}", "-Dsubsonic.defaultPlaylistFolder=${PLAYLISTS_FOLDER}", "-Djava.awt.headless=true", "-jar", "subsonic-booter-jar-with-dependencies.jar"]