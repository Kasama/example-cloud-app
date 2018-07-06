#!/bin/sh

docker run \
  --rm -d \
  --name ganglia \
  -v $(pwd)/gmetad.conf:/etc/ganglia/gmetad.conf \
  -p 8485:80 \
  -p 8649:8649 \
  -p 8652:8652 \
  n0needt0/docker-ganglia
