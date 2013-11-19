#!/bin/bash
usage() {
  echo "Usage: $0 MEDIA_DIR"
  exit 1
}

[[ ! -d $1 ]] && usage

container=$(docker run -d -v $1:/music cherrymusic:latest)
docker inspect $container | grep IPA

