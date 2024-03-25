#!/bin/bash
## CReate bridge network mynetwork(by default create bridge)
docker network create Mynetwork
##Create docker image
docker build -t mycoustomnginx -f Dockerfile .
#Create new container from our image
docker run -itd --name testingnginx -p 8080:80 --network=MyNetwork  mycoustomnginx
