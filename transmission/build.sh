#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1

f_log() {
  echo "=$1= $(date +%d/%m/%Y-%H:%M:%S) $2"
}

# Download dependencies
docker pull xataz/alpine:3.5

# Build transmission
f_log INF "Build xataz/transmission:latest ..."
docker build -t xataz/transmission:latest $FOLDER > /tmp/build.log 2>&1
if [ $? == 0 ]; then
  f_log INF "Build xataz/transmission:latest done"
  if [ "$DOCKER_PUSH" == "push" ]; then
    f_log INF "Push xataz/transmission:latest ..."
    docker push xataz/transmission:latest > /tmp/push.log 2>&1
    if [ $? == 0 ]; then
      f_log INF "Push xataz/transmission:latest done"
    else
      f_log ERR "Push xataz/transmission:latest failed"
      cat /tmp/push.log
    fi
  fi
else
  f_log ERR "Build xataz/transmission:latest failed"
  cat /tmp/build.log
fi
f_log INF "Build xataz/transmission:filebot ..."
docker build --build-arg WITH_FILEBOT=YES -t xataz/transmission:filebot $FOLDER > /tmp/build.log 2>&1
if [ $? == 0 ]; then
  f_log INF "Build xataz/transmission:filebot done"
  docker tag xataz/transmission:filebot xataz/transmission:latest-filebot
    if [ "$DOCKER_PUSH" == "push" ]; then
    f_log INF "Push xataz/transmission:filebot ..."
    docker push xataz/transmission:filebot > /tmp/push.log 2>&1
    docker push xataz/transmission:latest-filebot >> /tmp/push.log 2>&1
    if [ $? == 0 ]; then
      f_log INF "Push xataz/transmission:filebot done"
    else
      f_log ERR "Push xataz/transmission:filebot failed"
      cat /tmp/push.log
    fi
  fi
else
  f_log ERR "Build xataz/transmission:filebot failed"
  cat /tmp/build.log
fi
