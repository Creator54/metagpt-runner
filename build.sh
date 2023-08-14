#!/usr/bin/env bash

set -e

docker build --build-arg OPENAI_API_KEY=$(echo $OPENAI_API_KEY) . -t metagpt:custom
docker run --rm -p 4000:4000 -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) -v $(pwd):/app/metagpt/workspace -w /app/metagpt/ metagpt:custom ./entrypoint.sh "$@"
