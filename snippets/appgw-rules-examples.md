# Rules and rewrites examples

## Basic rule
- Listener HTTP 80 -> backendPool -> httpSetting

## Path-based routing
- `/` -> webPool
- `/api/*` -> apiPool

## HTTPS redirect
- HTTP listener returns 301 to HTTPS

## Header rewrite
- Add `X-Forwarded-Proto: https`
- Override host header to backend FQDN when needed

## Weighted backends (blue/green)
- Split traffic between two backend pools using multiple rules with priorities

## Health probes
- Custom probe to `/healthz` with interval/timeout/unhealthy threshold
