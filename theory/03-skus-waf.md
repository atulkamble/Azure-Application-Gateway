# SKUs and WAF

## SKUs

- Standard_v2: Modern default. Autoscaling, zone redundancy, better performance.
- WAF_v2: Standard_v2 + Web Application Firewall (OWASP CRS, custom rules, bot protection).

## WAF modes

- Detection: Log matches, don’t block
- Prevention: Block malicious requests

## WAF policy

- Centralized, reusable across gateways and listeners via association
- Managed rule sets (OWASP 3.x), exclusions for noisy rules, custom rules

## Best practices

- Prefer WAF_v2 for internet-exposed apps
- Start in Detection mode, review logs, then move to Prevention
- Use Key Vault for TLS certs, rotate regularly
- Use health probes to a dedicated `/healthz` endpoint where possible
