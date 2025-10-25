# Azure Application Gateway — Learning & Hands-on Pack

This repository is a structured, end-to-end learning and hands-on pack for Azure Application Gateway. It includes:

- theory: Concepts, architecture, SKUs, WAF, pricing
- steps: Step-by-step guides (Portal, CLI, Terraform)
- snippets: Reusable commands and code snippets (az CLI, Terraform)
- practicals: Lab-style exercises
- terraform: Ready-to-deploy examples (Basic, WAF)
- code: Tiny backend apps to test routing through Application Gateway

## Quick start

- New to Application Gateway? Read `theory/01-overview.md`.
- Want to deploy fast with Terraform? See `terraform/basic-appgw/README.md`.
- Prefer CLI? See `steps/03-cli-setup.md` and `snippets/az-cli.md`.

## Structure

- `theory/` — in-depth background and design guidance
- `steps/` — prerequisites and setup walkthroughs
- `snippets/` — copy/paste friendly commands for common tasks
- `practicals/` — hands-on labs (path routing, SSL termination, WAF)
- `terraform/` — two examples: basic Standard_v2 and WAF_v2 + Policy
- `code/` — two super-light Node.js services to demonstrate routing

## Requirements

- Azure subscription and permissions to create networking + App Gateway
- Terraform v1.5+ and azurerm provider 3.x
- (Optional) Node.js 18+ for local test services (see `code/`)

## Notes

- The Terraform samples use Standard_v2 and WAF_v2 SKUs and a dedicated subnet for the gateway, as required by Azure best practices.
- All resources are tagged; adjust naming, regions, and tags to your conventions.
