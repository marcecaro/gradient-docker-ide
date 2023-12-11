#!/bin/bash

# Source: https://gist.github.com/earthgecko/3089509
# Generates a random alphanumeric string of length 48 (like a jupyter notebook token i.e. c8de56fa4deed24899803e93c227592aef6538f93025fe01)
# if [ -z "$JUPYTER_TOKEN" ]; then
#     JUPYTER_TOKEN=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 48 | head -n 1)
# fi

# Note: print mocked jupyter token so that we can run this container as if it is a notebook within Gradient V1
echo "http://localhost:8888"
cat /root/.config/code-server/config.yaml  | grep password 
#/usr/local/bin/python3 /usr/local/bin/jupyter-lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin=* --ServerApp.allow_credentials=True &
/usr/bin/jupyter --auth none --bind-addr "0.0.0.0:8888" . 


