FROM library/alpine:3.7

LABEL MAINTAINER Leonard Lee <leonardlee@outlook.com>

RUN apk add --no-cache \
  python3=3.6.3-r9 && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --upgrade \
    pip===9.0.1 \
    setuptools===38.4.0 \
    mkdocs===0.17.2 && \
  if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
  if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
  rm -r /root/.cache

WORKDIR /docs

VOLUME /docs
EXPOSE 8000

# ENTRYPOINT ["mkdocs"]