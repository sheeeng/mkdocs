#!/usr/bin/env bash

docker image build \
  --file ${PWD}/Dockerfile \
  --tag sheeeng/mkdocs:latest \
  ${PWD}
