# Lab: SSL termination at Application Gateway

Goal: Terminate TLS at the gateway and forward HTTP to backends.

## Steps
1) Obtain a PFX certificate (self-signed for test or real cert).
2) In Portal or CLI, upload the SSL cert to the gateway (`site-cert`).
3) Create frontend port 443 and HTTPS listener with SNI hostnames if needed.
4) Update routing rule to use the HTTPS listener.
5) Optionally redirect HTTP -> HTTPS using a redirect configuration.

## CLI hints
See `snippets/az-cli.md` for adding SSL certs and creating HTTPS listener.

## Validation
- `curl -I https://<PUBLIC_IP>` (if using IP) or domain
- Browser should show secure connection; backend still speaks HTTP.
