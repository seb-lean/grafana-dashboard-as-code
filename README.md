# Node.js Application Monitoring with Prometheus and Grafana

The repository contains a sample Node.js app that integrates the [Prometheus client for node.js](https://github.com/siimon/prom-client) and exposes metrics on [http://localhost:8080/metrics](http://localhost:8080/metrics). The metrics are periodically scraped by [Prometheus](https://prometheus.io) and visualized through a [Grafana](https://grafana.com/oss/grafana) monitoring dashboard.

## Prerequisites

Make sure that you have Docker and Docker Compose installed:

- [Docker Engine](https://docs.docker.com/engine)
- [Docker Compose](https://docs.docker.com/compose)

## Getting started

Clone the repository:

```bash
git clone git@github.com:seb-lean/grafana-dashboard-as-code.git
```

Navigate into the project directory:

```bash
cd grafana-dashboard-as-code
```

Start the Docker containers:

```bash
docker compose up --build
```

**You should now be able to see the generated Grafana dashboards at**
[http://localhost:3000/d/empty_dashboard/my-cool-dashboard](http://localhost:3000/d/empty_dashboard/my-cool-dashboard)

## Test containers

- Prometheus should be accessible via [http://localhost:9090](http://localhost:9090). eg query [http_request_duration_ms_count](<http://localhost:9090/new/graph?g0.expr=sum(rate(http_request_duration_ms_count%5B1m%5D))%20by%20(service%2C%20route%2C%20method%2C%20code)%20%20*%2060&g0.tab=0&g0.stacked=0&g0.range_input=30m>)
- Grafana should be accessible via [http://localhost:3000](http://localhost:3000)
- Example Node.js server metrics for monitoring should be accessible via [http://localhost:8080/metrics](http://localhost:8080/metrics)

## Grafonnet

This demo uses [Jsonnet](https://jsonnet.org/) and [Grafonnet](https://grafana.github.io/grafonnet-lib/) to programmatically build the JSON used to describe dashboard and panels.

As per the Grafonnet docs, we also use [Grizzly](https://grafana.github.io/grizzly/what-is-grizzly/) to watch for changes and deploy them. Once Docker is running you can even make changes to `main.jsonnet` and they'll automatically be reflected on Grafana. Just refresh!

## Demo video

https://www.youtube.com/watch?v=xEi-UKYCIYI
