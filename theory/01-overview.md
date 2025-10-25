# Azure Application Gateway — Overview

Azure Application Gateway is a Layer 7 (HTTP/HTTPS) load balancer and web traffic manager. It provides application-level routing, SSL termination, session affinity, Web Application Firewall (WAF), autoscaling, and more.

## Core building blocks

- Frontend IP: Public and/or private. Binds to listeners.
- Listener: Listens on a frontend IP/port/protocol (HTTP/HTTPS). For HTTPS, associates a certificate.
- Backend pool: Targets (IP/FQDN/App Service). Can be VMSS, VM, Container/AKS, App Service, private endpoints.
- HTTP settings: Protocol/port, timeout, cookie affinity, health probe, host header behavior.
- Health probe: Custom path/interval/timeout/threshold; per backend.
- Routing rules: Basic or Path-based. Connect listener -> backend pool + HTTP settings.
- Rewrites/Redirects: Modify headers/URLs or redirect to HTTPS/other host.
- WAF (v2): Centralized policy (OWASP Core Rule Set), custom rules, exclusions, bot protection.

## SKUs

- Standard_v2: Modern, autoscaling, zone redundant, recommended.
- WAF_v2: Same as Standard_v2 + WAF.

Avoid legacy v1 SKUs for new workloads.

## Common use cases

- TLS offload and central cert management
- Path-based routing to multiple apps behind one IP (e.g., `/api` -> API, `/` -> web)
- Host-based routing for multiple domains
- WAF protection for internet-exposed apps
- Blue/green deployments with rules and weights
- AKS Ingress using AGIC (Application Gateway Ingress Controller)

## Limits and quotas (highlights)

- One dedicated subnet per gateway
- Max listeners/rules vary by SKU — check current limits in Azure docs
- TLS cert size and SNI hostnames have limits

## Pricing drivers

- SKU/hour + capacity + data processed + WAF add-on when enabled
- Public IP and egress costs apply

## When to choose Application Gateway

- Need L7 features (path/host routing, WAF, header rewrites)
- Prefer managed L7 load balancer vs NGINX/Envoy DIY
- Integrate with App Service, AKS, or VMs easily
