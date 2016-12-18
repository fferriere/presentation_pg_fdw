#!/bin/bash

docker run -ti -v $(pwd):$(pwd) -w $(pwd) cloudson_gitql "$@"
