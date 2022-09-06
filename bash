docker login docker-registry:5000 -u user -p password

docker pull ubuntu:latest
docker tag ubuntu:latest docker-registry:5000/myubuntu:v1
docker push docker-registry:5000/myubuntu:v1

kubectl run test --image docker-registry:5000/myubuntu:v1 
kubectl describe pod/test
