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

## Test containers

- Prometheus should be accessible via [http://localhost:9090](http://localhost:9090)
- Grafana should be accessible via [http://localhost:3000](http://localhost:3000)
- Example Node.js server metrics for monitoring should be accessible via [http://localhost:8080/metrics](http://localhost:8080/metrics)

## Grafonnet

This demo uses [Jsonnet](https://jsonnet.org/) and [Grafonnet](https://grafana.github.io/grafonnet-lib/) to programmatically build the JSON used to describe dashboard and panels.

As per the Grafonnet docs, we also use [Grizzly](https://grafana.github.io/grizzly/what-is-grizzly/) to watch for changes and deploy them. Once Docker is running you can even make changes to `main.jsonnet` and they'll automatically be reflected on Grafana. Just refresh!
