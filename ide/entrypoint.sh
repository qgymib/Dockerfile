#!/bin/bash

if [ "$1" = 'vim' ]; then
	exec gosu $DOCKER_USER "$@"
fi

exec "$@"

