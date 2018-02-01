#!/usr/bin/env bash

docker container run \
  --interactive \
  --tty \
  --rm \
  --volume `pwd`:/docs:rw \
  sheeeng/mkdocs:latest \
  sh -c " \
    uname -a && \
    cat /etc/*-release && \
    python --version && \
    python -m easy_install --version && \
    pip --version && \
    pip freeze && \
    mkdocs --version
    "