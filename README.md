# PA-51

1. ```vagrant up```

2. add this line to /etc/hosts on your local machine to properly test this task.
```192.168.56.240 myapp.example.com```

Docker Registry is running on master-1 virtual machine, with authentication and https encryption. 
It is accesible within the local network, also inside the cluster. 

## Testing

### On your local machine
```curl myapp.example.com```  to verify ingress is running as it should.

### On any node
```docker pull docker.registry.com:5000/nginx:v1``` on any node to verify docker registry is accesible in local network. 

### On master node
```kubectl create -f /vagrant/deployment/test.yaml``` to test if docker registry is accesible inside cluster.