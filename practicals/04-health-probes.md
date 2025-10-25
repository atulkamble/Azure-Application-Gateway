# Lab: Custom health probes

Goal: Configure custom probes to a dedicated health endpoint.

## Steps
1) Implement `/healthz` endpoint in your services.
2) Create a probe with path `/healthz`, interval 30s, timeout 30s, unhealthy threshold 3.
3) Associate probe with HTTP settings used by your backends.
4) Observe probe status and backend health in Portal/metrics.

## Notes
- Probes are per HTTP setting. Different backends can have different probes.
- For end-to-end TLS, set `pick_host_name_from_backend_http_settings` and trust backend cert.
