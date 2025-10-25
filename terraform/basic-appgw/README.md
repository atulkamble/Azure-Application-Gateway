# Terraform: Basic Application Gateway (Standard_v2)

This example deploys a minimal Application Gateway (Standard_v2) with a public IP, vNet/subnet, and a basic HTTP rule.

## Files
- `main.tf` — resources
- `variables.tf` — inputs with defaults
- `outputs.tf` — key outputs (gateway id, public ip)
- `terraform.tfvars.example` — sample values

## Usage

```bash
# macOS / zsh
cd terraform/basic-appgw

# Initialize providers
terraform init

# Copy and edit variables
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars to set backend_ip_addresses and resource_group_name

# Review plan
terraform plan

# Apply
terraform apply -auto-approve

# Output public IP
terraform output public_ip
```

## Clean up
```bash
terraform destroy -auto-approve
```

## Notes
- Application Gateway requires a dedicated subnet. This sample creates `appgw-subnet`.
- For HTTPS and advanced routing, extend this example or see the WAF sample.
