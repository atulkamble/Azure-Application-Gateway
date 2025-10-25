# Costing and limits

## Cost components

- Gateway hours (per SKU/tier)
- Capacity units and data processed
- WAF surcharge for WAF_v2
- Public IP, egress
- Log Analytics ingestion if enabled

## Optimize cost

- Right-size capacity or rely on autoscaling
- Use private-only if no public exposure needed
- Reuse gateway for multiple apps via host/path rules
- Turn on logs selectively; use retention policies

## Limits (check docs for up-to-date values)

- Max listeners/rules/backends per gateway
- Max TLS certs and SNI names
- Probe limits and timeout ranges

## References

- Azure pricing: Application Gateway
- Azure limits: Networking limits
