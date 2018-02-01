# MkDocs

[![GitHub Watchers](https://img.shields.io/github/watchers/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/watchers)
[![GitHub Stars](https://img.shields.io/github/stars/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/network)
[![GitHub Issues](https://img.shields.io/github/issues/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/pulls)

[![Github Commits Since Latest Release)](https://img.shields.io/github/commits-since/sheeeng/mkdocs/latest.svg)](https://github.com/sheeeng/mkdocs/commits/master)
[![GitHub last commit](https://img.shields.io/github/last-commit/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/commits/master)
[![GitHub Tags](https://img.shields.io/github/tag/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/tags)
[![GitHub Releases](https://img.shields.io/github/release/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/releases)
[![GitHub Contributors](https://img.shields.io/github/contributors/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/graphs/contributors)
[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/sheeeng/mkdocs/blob/master/LICENSE)

[![Docker Stars](https://img.shields.io/docker/stars/sheeeng/mkdocs.svg)](https://hub.docker.com/r/sheeeng/mkdocs/)
[![Docker Pulls](https://img.shields.io/docker/pulls/sheeeng/mkdocs.svg)](https://hub.docker.com/r/sheeeng/mkdocs/)
[![Docker Automated Build](https://img.shields.io/docker/automated/sheeeng/mkdocs.svg)](https://hub.docker.com/r/sheeeng/mkdocs/builds/)
[![Docker Build Status](https://img.shields.io/docker/build/sheeeng/mkdocs.svg)](https://hub.docker.com/r/sheeeng/mkdocs/builds/)

[![](https://images.microbadger.com/badges/image/sheeeng/mkdocs.svg)](https://microbadger.com/images/sheeeng/mkdocs)
[![](https://images.microbadger.com/badges/version/sheeeng/mkdocs.svg)](https://microbadger.com/images/sheeeng/mkdocs)

[![GitHub Release Date](https://img.shields.io/github/release-date/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/releases)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs/commits/master)
[![GitHub Code Size in Bytes](https://img.shields.io/github/languages/code-size/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs)
[![GitHub Repository Size in Bytes](https://img.shields.io/github/repo-size/sheeeng/mkdocs.svg)](https://github.com/sheeeng/mkdocs)

Docker built [mkdocs](http://www.mkdocs.org/) image for building [MkDocs](http://www.mkdocs.org/) documentation.

See Docker [Hub](https://hub.docker.com/r/sheeeng/mkdocs/) or Docker [Cloud](https://cloud.docker.com/app/sheeeng/repository/docker/sheeeng/mkdocs/) repository that automatically builds from the GitHub [repository](https://github.com/sheeeng/mkdocs).

## Usage

### Build Docker Image

```
docker image build \
  --file ${PWD}/Dockerfile \
  --tag sheeeng/mkdocs:latest \
  ${PWD}
```

### Create a new MkDocs Project

Create a new MkDocs project directory. Go into it.

```
docker container run \
  --interactive \
  --tty \
  --rm \
  --user $(id -u):$(id -g) \
  --volume `pwd`:/docs:rw \
  sheeeng/mkdocs:latest \
  sh -c " \
    python --version
    pip --version && \
    mkdocs new .
    "
```

### Build The Documentation

Go into MkDocs project directory.

```
docker container run \
  --interactive \
  --tty \
  --rm \
  --volume `pwd`:/docs:rw \
  sheeeng/mkdocs:latest \
  sh -c " \
    python --version
    pip --version && \
    mkdocs build
    "
```

If you want to generate them in other place mount `/docs/site` as a volume:

```
docker container run \
  --interactive \
  --tty \
  --rm \
  --volume `pwd`:/docs:rw \
  --volume $HOME/site:/docs/site \
  sheeeng/mkdocs:latest \
  sh -c " \
    python --version
    pip --version && \
    mkdocs build
    "
```

### Serve The Documentation

Go into MkDocs project directory.

```
docker container run \
  --interactive \
  --tty \
  --rm \
  --publish 8000:8000 \
  --volume `pwd`:/docs:rw \
  sheeeng/mkdocs:latest \
  sh -c " \
    python --version
    pip --version && \
    mkdocs serve --dev-addr 0.0.0.0:8000
    "
```

