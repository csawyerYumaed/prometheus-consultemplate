#!/bin/bash
CONSUL_TEMPLATE="0.15.0"
wget https://releases.hashicorp.com/consul-template/$CONSUL_TEMPLATE/consul-template_${CONSUL_TEMPLATE}_linux_amd64.zip
unzip consul-template_${CONSUL_TEMPLATE}_linux_amd64.zip
BVER="0.4.0"
wget https://github.com/novilabs/bifurcate/releases/download/v$BVER/bifurcate_${BVER}_linux_amd64.tar.gz
tar -xzvf bifurcate_${BVER}_linux_amd64.tar.gz
docker build -t prometheus .
docker tag prometheus registry.service.consul:5000/prometheus
docker push registry.service.consul:5000/prometheus
