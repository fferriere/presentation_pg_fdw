#!/bin/bash

docker run -ti -v $(pwd):$(pwd) -w $(pwd) gitql_gitql "$@"
