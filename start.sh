#!/bin/sh

set -e

echo "run gooseup"
source /app/app.env
/app/migrate -dir ./migration/ -v postgres "$DB_SOURCE" up

echo "start the app"
exec "$@"