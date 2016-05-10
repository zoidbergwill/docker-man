FROM python:2.7.11-alpine
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

# ca-certificates not installed in Alpine Python images for some reason:
# https://github.com/docker-library/python/issues/109
RUN apk add --no-cache ca-certificates

# pip: Disable cache -- no Praekelt PyPi for Alpine yet...
ENV PIP_NO_CACHE_DIR="false"

# Install utility scripts
COPY ./common/scripts /scripts
# COPY ./alpine/scripts /scripts
ENV PATH $PATH:/scripts

# Install dinit (dumb-init)
ENV DINIT_VERSION="1.0.2" \
    DINIT_SHA256="a8defac40aaca2ca0896c7c5adbc241af60c7c3df470c1a4c469a860bd805429"
RUN set -x \
    && apk add --no-cache curl \
    && DINIT_FILE="dumb-init_${DINIT_VERSION}_amd64" \
    && curl -sSL -o /usr/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v$DINIT_VERSION/$DINIT_FILE" \
    && echo "$DINIT_SHA256 */usr/bin/dumb-init" | sha256sum -c - \
    && chmod +x /usr/bin/dumb-init \
    && ln -s /usr/bin/dumb-init /usr/local/bin/dinit \
    && apk del curl

# Set dinit as the default entrypoint
ENTRYPOINT ["eval-args.sh", "dinit"]
CMD ["python"]
