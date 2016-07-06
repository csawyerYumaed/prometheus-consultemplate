FROM prom/prometheus
MAINTAINER csawyer@yumaed.org
RUN rm /etc/prometheus/prometheus.yml
COPY consul-template /consul-template
COPY prom.tmpl /prom.tmpl
COPY prom /prom
COPY reload /reload
COPY bifurcate /bifurcate
COPY bifurcate.json /bifurcate.json
EXPOSE 9090
ENTRYPOINT ["/bifurcate"]
CMD ["/bifurcate.json"]
