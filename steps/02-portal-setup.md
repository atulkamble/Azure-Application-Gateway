# Portal setup (walkthrough)

1) Create Resource Group
- Search: Resource groups -> Create -> Name, Region

2) Create Virtual Network and Subnets
- `vnet`: Address space 10.0.0.0/16 (example)
- `appgw-subnet`: 10.0.1.0/24 (dedicated to App Gateway)

3) Create Public IP (Standard, Static)
- Name: `agw-pip`
- SKU: Standard
- Allocation: Static

4) Create Application Gateway
- SKU: Standard_v2 or WAF_v2
- Frontend IP: Public (select `agw-pip`)
- Backend pool: Add targets (IPs/FQDNs or App Services)
- HTTP settings: Protocol/port/timeouts; probe path
- Listener: HTTP 80 and/or HTTPS 443 (upload cert for HTTPS)
- Routing rules: Basic or Path-based (map to pool + settings)

5) Diagnostics
- Enable logs to Log Analytics Workspace
- Review metrics and logs after traffic

6) Test
- Browse to Public IP or DNS label
- Verify routing to your backend(s)
