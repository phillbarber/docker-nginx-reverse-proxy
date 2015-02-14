NGINX proxy for Artifactory
================
This docker image runs NGINX on port 443 and provides ssl for a service downstream (i.e. a reverse proxy)

First time setup
================

- Run the createCertificate.sh script

- To wrap another service provided by a different docker container, start your container with a name, e.g.

 docker run -d -p 8080:8080 --name myservice myusername/mydockerimage

 and then run

 ./runDockerImage.sh myservice

 or

 docker run --name nginx-reverse-proxy -d -p 80:80 -p 443:443 -v ~/nginx-reverse-proxy/certs:/etc/nginx-reverse-proxy/certs --link myservice:proxied-service-link phillbarber/nginx-reverse-proxy

