# FROM python:3
FROM jenkins/inbound-agent:4.10-3

WORKDIR /home/jenkins

USER root

# install JJB as root
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install pip=22.0.2 -y --no-install-recommends \
    && pip install jenkins-job-builder -v stable \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# change back to jenkins to prevent conflicts during startup
USER jenkins