docker login docker.registry.com:5000 -u user -p password
docker pull ubuntu:latest
docker tag ubuntu:latest docker.registry.com:5000/ubuntu:v1
docker push docker.registry.com:5000/ubuntu:v1
kubectl create -f /vagrant/deployment/test.yaml
sleep 5 && kubectl describe pod test
