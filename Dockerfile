FROM ubuntu:14.04
MAINTAINER Chelsea Zhang <chelsea@bluelabs.com>

# Based on https://registry.hub.docker.com/u/pblittle/docker-logstash/dockerfile/

# Download latest package lists
RUN apt-get update

# Install dependencies
RUN apt-get install -yq \
    openjdk-7-jre-headless \
    wget \
    && apt-get clean

# Download version 1.4.2 of logstash
RUN cd /tmp && \
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar -xzvf ./logstash-1.4.2.tar.gz && \
    mv ./logstash-1.4.2 /opt/logstash && \
    rm ./logstash-1.4.2.tar.gz

VOLUME /conf

EXPOSE 5043

# Start logstash
CMD /opt/logstash/bin/logstash -f /conf/logstash.conf