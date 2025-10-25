# Terraform: WAF_v2 Application Gateway + Policy

This example deploys an Application Gateway with WAF_v2 tier and attaches a WAF policy using the OWASP rule set.

## Files
- `main.tf` — resources (gateway + WAF policy)
- `variables.tf` — inputs with defaults
- `outputs.tf` — key outputs (gateway id, public ip)

## Usage
```bash
cd terraform/waf-appgw
terraform init

# Create your terraform.tfvars
cat > terraform.tfvars <<'EOF'
resource_group_name  = "agw-demo-rg"
location             = "eastus"
backend_ip_addresses = ["10.0.2.4", "10.0.2.5"]
waf_mode             = "Detection" # switch to "Prevention" later
EOF

terraform plan
terraform apply -auto-approve
terraform output public_ip
```

## Switch to Prevention
- Update `waf_mode = "Prevention"` and `terraform apply`.
- Review firewall logs in Log Analytics when enabled.

## Clean up
```bash
terraform destroy -auto-approve
```
