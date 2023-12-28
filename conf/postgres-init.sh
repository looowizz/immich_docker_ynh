#!/bin/sh

# The content of: "/docker-entrypoint-initdb.d/init-user-db.sh"

set -ex

psql -U postgres -c "CREATE DATABASE \"$DB_NAME\" OWNER \"$DB_USER\""
