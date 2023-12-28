#!/bin/sh

# The content of: "/docker-entrypoint-initdb.d/init-user-db.sh"

set -ex

gunicorn --config gunicorn.conf.py wsgi
