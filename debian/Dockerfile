FROM debian:jessie

# Install utility scripts
COPY scripts /scripts
ENV PATH $PATH:/scripts

RUN set -xe; \
    apt-get-install.sh man-db;

CMD ["bash"]
