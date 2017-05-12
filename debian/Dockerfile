FROM debian:jessie

# Install utility scripts
COPY scripts /scripts
ENV PATH $PATH:/scripts

RUN set -xe; \
    apt-get-install.sh man-db; \
    apt-get update; \
    dpkg -l | grep '^ii ' | sed 's/  */\t/g' | cut -f 2,3 | sed 's/\t/=/' | xargs apt-get install -y --reinstall --ignore-missing -o APT::Install-Recommends=false -o APT::Install-Suggests=false || true; \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
