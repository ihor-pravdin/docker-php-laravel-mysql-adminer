#!/usr/bin/env bash
set -e

if [ ! -d "$APP_NAME" ]; then

   gosu root laravel new "$APP_NAME" 

fi

exec "$@"