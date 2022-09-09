#!/bin/bash
docker login docker.registry.com:5000 -u user -p password

docker pull ubuntu:latest
docker tag ubuntu:latest docker.registry.com:5000/ubuntu:v1
docker push docker.registry.com:5000/ubuntu:v1

docker pull nginx:latest
docker tag nginx:latest docker.registry.com:5000/nginx:v1
docker push docker.registry.com:5000/nginx:v1

docker image rm docker.registry.com:5000/nginx:v1 docker.registry.com:5000/ubuntu:v1

kubectl create -f /vagrant/deployment/nginx-deployment.yaml 