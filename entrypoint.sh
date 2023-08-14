#!/usr/bin/env bash

set -e

./startup.py "$@"

chown -R $HOST_UID:$HOST_GID /app/metagpt/workspace
