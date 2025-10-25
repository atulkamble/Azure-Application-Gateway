# Architecture patterns for Application Gateway

## 1) Internet ingress for multi-app routing

- Single public IP
- Host-based rules for `app1.contoso.com`, `app2.contoso.com`
- Path-based rules for `/api`, `/static`
- SSL termination at gateway, optional end-to-end TLS

## 2) Private ingress (ILB) for East-West traffic

- Private frontend only
- Used for internal apps or hub-spoke
- Combine with Private DNS and Private Link backends

## 3) AKS ingress with AGIC

- Application Gateway Ingress Controller manages rules from Kubernetes Ingress resources
- Great when you want a managed L7 on top of AKS without running NGINX

## 4) App Service backends

- Backend pool targets App Service FQDNs
- Use `pick_host_name_from_backend_address` or override host header
- Configure health probes against `/` or a specific health endpoint

## 5) Global entry with Azure Front Door + regional App Gateways

- Front Door for global routing/caching/WAF
- Application Gateway in each region for L7 to backends
- Useful for active-active multi-region

## Network topology tips

- Dedicated subnet for Application Gateway only
- NSGs typically not required on the subnet; if used, allow required ports
- Prefer zone-redundant and autoscaling (v2)

## Certificates and TLS

- Use Key Vault integration for certificate management when possible
- For end-to-end TLS, ensure backend has a valid cert (trusted, correct host)

## Observability

- Diagnostics to Log Analytics/Azure Monitor
- Access logs, performance logs, and firewall logs (WAF)
- Health probe status and backend status in portal and metrics
