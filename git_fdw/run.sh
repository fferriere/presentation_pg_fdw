#!/bin/bash

NAME=postgres_git_fdw
NB_ROWS=$(docker ps -a | grep -w "$NAME" | wc -l)
if [ "$NB_ROWS" -gt 0 ]; then
    docker rm "$NAME"
fi

docker run --name $NAME postgres_git_fdw postgres
