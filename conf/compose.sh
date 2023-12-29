#!/bin/bash

source common.env

set -ex

# Compose v2 is always accessible as docker compose!
# But Debian bullseye contains v1
exec docker-compose "$@"
