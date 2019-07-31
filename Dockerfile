FROM openjdk:8
MAINTAINER Jean-Christophe Fillion-Robin "jchris.fillionr@kitware.com"

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/share/bfg-repo-cleaner

RUN \
  apt-get update --yes && apt-get install --yes \
    runit \
  && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean --yes && \
  curl -LO https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar && \
  mv bfg-1.13.0.jar bfg.jar

ENTRYPOINT ["/usr/share/bfg-repo-cleaner/entrypoint.sh", "java", "-jar", "/usr/share/bfg-repo-cleaner/bfg.jar"]

COPY imagefiles/entrypoint.sh /usr/share/bfg-repo-cleaner/

WORKDIR /work

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG IMAGE
ARG VCS_REF
ARG VCS_URL
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$IMAGE \
      org.label-schema.description="Dockerized version of GitRocketFilter: Rewrite git branches in a powerful way." \
      org.label-schema.url="https://github.com/jcfr/dockbfg-repo-cleaner" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.schema-version="1.0"
