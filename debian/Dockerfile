FROM debian:jessie

# Install utility scripts
COPY scripts /scripts
ENV PATH $PATH:/scripts

RUN set -xe; \
    apt-get-install.sh dnsutils man-db strace;

CMD ["bash"]
