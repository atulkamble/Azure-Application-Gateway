# Lab: Path-based routing

Goal: Route `/` to service-a and `/api/*` to service-b using Application Gateway.

## Prereqs
- Complete `steps/01-prereqs.md`
- Optionally run local services from `code/`

## Steps
1) Deploy `terraform/basic-appgw` (creates gateway, vnet, pip).
2) Update `terraform/basic-appgw/terraform.tfvars` with backend IPs pointing to service-a and service-b (or any reachable endpoints).
3) Apply Terraform.
4) Create additional pools/settings/rules for path-based routing:
   - Pool: `webPool` (service-a IP)
   - Pool: `apiPool` (service-b IP)
   - HTTP settings: `webHttp`, `apiHttp`
   - URL path map: `/` -> webPool, `/api/*` -> apiPool
   You can do this via Portal or extend Terraform (see `snippets/terraform-snippets.md`).
5) Test via the public IP or DNS; hit `/` and `/api/hello`.

## Validation
- `curl http://<PUBLIC_IP>/` returns service-a response
- `curl http://<PUBLIC_IP>/api/hello` returns service-b response
