# Terraform deployment steps

1) Install prerequisites (see `steps/01-prereqs.md`).
2) Choose an example:
   - `terraform/basic-appgw` (Standard_v2)
   - `terraform/waf-appgw` (WAF_v2 + Policy)
3) Initialize and apply.

## Basic example
```bash
cd terraform/basic-appgw
terraform init
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars (set resource_group_name, backend_ip_addresses)
terraform apply -auto-approve
terraform output public_ip
```

## WAF example
```bash
cd terraform/waf-appgw
terraform init
# Create terraform.tfvars with your values (see README)
terraform apply -auto-approve
terraform output public_ip
```

## Destroy
```bash
terraform destroy -auto-approve
```
