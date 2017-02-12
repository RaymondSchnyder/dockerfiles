# Sonerezh

## Tag available
* latest, 1.1.3, 1.1, 1 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/reverse-nginx/mainline/Dockerfile)

## Features
* No ROOT process
* ARG for custom build
* Very light (~100MB)
* Support sqlite, mysql and pgsql

## Description
What is [Sonerezh](https://www.sonerezh.bzh/)?

A self-hosted, web-based application to stream your music, everywhere.

## Build Image
### Build arguments
* SONEREZH_VER : sonerezh version

# Simply build
```shell
docker build -t xataz/sonerezh github.com/xataz/dockerfiles.git#master:sonerezh
```
### Build other version
```shell
docker build -t xataz/sonerezh --build-arg SONEREZH_VER=1.1.1 github.com/xataz/dockerfiles.git#master:sonerezh
```

## Usage
### Environments
| Variable | Description | default | value |
| -------- | ----------- | ------- | ----- |
| UID | UID for launch sonerezh | 991 | Valid UID number |
| GID | GID for launch sonerezh | 991 | Valid GID number |

### Labels
| Label Name | Description | default | value |
| ---------- | ----------- | ------- | ----- |
| reverse.frontend.domain | Domain Name for this service | mydomain.local | valid domain name |
| reverse.frontend.path | Domain path (warning, no rewrite url) | / | valid path, with / |
| reverse.frontend.auth | For auth basic | none | user:encryptpassword |
| reverse.frontend.ssltype | Choose ssl type | ec384 | rsa2048, rsa4096, rsa8192, ec256 or ec384 |
| reverse.frontend.domain\_max\_body\_size | Choose max size upload | 200M | Numeric value with unit (K,M,G,T) |
| reverse.frontend.ssl | Generate letsencrypt certificate | false | true or false |
| reverse.backend.port | Port use by container | 8080 | Valid port number |

More labels soon !!!

### Volumes
* /data
* /musics
* /thumbmails

### Ports
* 8080

### Launch
```shell
docker run -d \
	-p 80:8080 \
    --name sonerezh \
    -e UID=1002
	xataz/sonerezh
```

URI Access : http://xx.xx.xx.xx



