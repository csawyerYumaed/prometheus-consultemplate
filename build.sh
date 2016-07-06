#!/bin/bash
#versions of the tools we use.
CONSUL_TEMPLATE="0.15.0"
BVER="0.4.0"
#get consul-template
wget https://releases.hashicorp.com/consul-template/$CONSUL_TEMPLATE/consul-template_${CONSUL_TEMPLATE}_linux_amd64.zip
unzip consul-template_${CONSUL_TEMPLATE}_linux_amd64.zip
#get bifurcate
wget https://github.com/novilabs/bifurcate/releases/download/v$BVER/bifurcate_${BVER}_linux_amd64.tar.gz
tar -xzvf bifurcate_${BVER}_linux_amd64.tar.gz
# build this sucker and push to registry!
docker build -t prometheus .
docker tag prometheus registry.service.consul:5000/prometheus
docker push registry.service.consul:5000/prometheus
# CLEANUP
rm consul-template_${CONSUL_TEMPLATE}_linux_amd64.zip
rm consul-template
rm bifurcate_${BVER}_linux_amd64.tar.gz
rm bifurcate
