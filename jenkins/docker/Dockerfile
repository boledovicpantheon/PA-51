# FROM python:3
FROM jenkins/inbound-agent

WORKDIR /home/jenkins

USER root

# install JJB as root
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install pip -y \
    && pip install jenkins-job-builder

# change back to jenkins to prevent conflicts during startup
USER jenkins