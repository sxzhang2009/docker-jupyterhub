#!/bin/bash

#sudo systemctl restart docker

#sudo export OAUTH2_AUTHORIZE_URL="https://192.168.8.206:443/oauth/authorize"
#sudo export OAUTH2_TOKEN_URL="https://192.168.8.206:443/oauth/token"
sudo docker stop jupyterhub
sudo docker rm jupyterhub
sudo docker run -v $PWD:/srv/jupyterhub:z -v $PWD/notebooks:/notebooks:z -p 8000:8000 \
     --name jupyterhub --env-file env.list -t jupyterhub-server:1.0 
