#!/bin/sh

set -eo pipefail
database_env_variables=$(node /url-to-env.js "$DATABASE_URL")

eval $database_env_variables

exec "$@"
