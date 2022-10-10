#!/bin/bash
sudo docker login docker.registry.com:5000 -u user -p password

sudo docker pull ubuntu:latest
sudo docker tag ubuntu:latest docker.registry.com:5000/ubuntu:v1
sudo docker push docker.registry.com:5000/ubuntu:v1

sudo docker pull nginx:latest
sudo docker tag nginx:latest docker.registry.com:5000/nginx:v1
sudo docker push docker.registry.com:5000/nginx:v1

sudo docker image rm docker.registry.com:5000/nginx:v1 docker.registry.com:5000/ubuntu:v1

kubectl create -f /vagrant/deployment/nginx-deployment.yaml 