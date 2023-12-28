#!/bin/bash

source common.env

set -ex

exec docker compose "$@"
