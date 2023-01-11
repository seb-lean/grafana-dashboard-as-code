local grafana = import 'vendor/grafonnet/grafana.libsonnet';

{
  grafanaDashboardFolder:: 'Dashboards',
  grafanaDashboards+:: {
    empty_dashboard: grafana.dashboard.new(
      title='My cool dashboard',
      schemaVersion=26,
      time_from='now-30m'
    ).addPanel(
      grafana.graphPanel.new(
        title='Request rate',
        datasource='prometheus',
        thresholds=[
          {
            value: 15,
            colorMode: 'critical',
            op: 'gt',
            fill: true,
            line: true,
            yaxis: 'left',
          },
        ]
      )
      .addTarget(
        grafana.prometheus.target(
          expr='sum(rate(http_request_duration_ms_count[1m])) by (service, route, method, code)  * 60',
        )
      ),
      gridPos={ h: 8, w: 8, x: 0, y: 0 }
    ).addPanel(
      grafana.graphPanel.new(
        title='Error rate',
        datasource='prometheus',
        thresholds=[
          {
            value: 0.65,
            colorMode: 'critical',
            op: 'gt',
            fill: true,
            line: true,
            yaxis: 'left',
          },
        ]
      )
      .addTarget(
        grafana.prometheus.target(
          expr='sum(increase(http_request_duration_ms_count{code=~"^5..$"}[5m])) /  sum(increase(http_request_duration_ms_count[5m]))',
        )
      ),
      gridPos={ h: 8, w: 8, x: 8, y: 0 }
    ).addPanel(
      grafana.graphPanel.new(
        title='Apdex latency',
        datasource='prometheus',
        thresholds=[
          {
            value: 0.8,
            colorMode: 'ok',
            op: 'lt',
            fill: true,
            line: true,
            yaxis: 'left',
          },
          {
            value: 0.8,
            colorMode: 'warning',
            op: 'gt',
            fill: true,
            line: true,
            yaxis: 'left',
          },
          {
            value: 0.95,
            colorMode: 'critical',
            op: 'gt',
            fill: true,
            line: true,
            yaxis: 'left',
          },
        ]
      )
      .addTarget(
        grafana.prometheus.target(
          expr='(sum(rate(http_request_duration_ms_bucket{le="100"}[1m])) by (service) +  sum(rate(http_request_duration_ms_bucket{le="300"}[1m])) by (service)) / 2 / sum(rate(http_request_duration_ms_count[1m])) by (service)',
        )
      ),
      gridPos={ h: 8, w: 8, x: 16, y: 0 }
    ),
  },
}
