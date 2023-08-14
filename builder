#!/usr/bin/env bash

set -e

if [ -z "$(echo $OPENAI_API_KEY)" ]; then
	echo "OPENAI_API_KEY environment variable not set!"
	exit 1
fi

docker build --build-arg OPENAI_API_KEY=$(echo $OPENAI_API_KEY) . -t metagpt:custom

if [ $# -eq 0 ]; then
	echo
	echo "Please provide a project to build. Ex: build me a cli snake game"
	exit 1
fi

docker run --rm -p 4000:4000 \
	-e HOST_UID=$(id -u) \
	-e HOST_GID=$(id -g) \
	-v "$(pwd)":/app/metagpt/workspace \
	-w /app/metagpt/ \
	metagpt:custom \
	./entrypoint "$@"
