# PA-51

1. ```vagrant up```

2. ``` echo "192.168.56.240 myapp.example.com" > /etc/hosts```

Docker Registry is running on master-1 virtual machine, with authentication and https encryption. 
It is accesible within the local network, also inside the cluster. 

If you 
1. copy certs/registry.crt from this repository to /etc/docker/certs.d/docker.registry.com:5000/ca.crt 
2. run ```systemctl restart docker```
3. run ```echo "192.168.56.11 docker.registry.com" > /etc/hosts ```

You can access docker registry from your local machine also.

## Testing

### On your local machine
```curl myapp.example.com```   ...to verify ingress is running as it should.

### On any node
```docker pull docker.registry.com:5000/nginx:v1```   ...to verify docker registry is accesible in local network. 

### On master node
```kubectl create -f /vagrant/deployment/test.yaml && sleep 5 && kubectl get pod test```   ...to test if docker registry is accesible inside cluster.
