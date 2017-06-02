FROM alpine:3.6

RUN set -xe; \
  apk add --no-cache git make man man-pages; \
  git clone --depth 1 git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git; \
  cd man-pages; \
  make; \
  cd ..; \
  rm -rf man-pages; \
  apk del git make
