# CLI setup (az commands)

This is a guided flow; you can also copy raw snippets from `snippets/az-cli.md`.

```bash
# Variables
LOCATION="eastus"
RG="agw-demo-rg"
VNET="agw-vnet"
APPGW_SUBNET="appgw-subnet"
PIP="agw-pip"
AGW="agw-demo"

# Resource group
az group create -n $RG -l $LOCATION

# VNet + Subnet (dedicated subnet required for App GW)
az network vnet create \
  -g $RG -n $VNET \
  --address-prefixes 10.0.0.0/16 \
  --subnet-name $APPGW_SUBNET \
  --subnet-prefixes 10.0.1.0/24

# Public IP (Standard, Static)
az network public-ip create \
  -g $RG -n $PIP \
  --sku Standard --allocation-method Static

# Backend IPs (example)
BACKENDS="10.0.2.4 10.0.2.5"

# Create Application Gateway (Standard_v2, HTTP only example)
az network application-gateway create \
  -g $RG -n $AGW \
  --sku Standard_v2 \
  --public-ip-address $PIP \
  --vnet-name $VNET \
  --subnet $APPGW_SUBNET \
  --frontend-port 80 \
  --http-settings-protocol Http --http-settings-port 80

# Add backend pool entries
for ip in $BACKENDS; do
  az network application-gateway address-pool update \
    -g $RG --gateway-name $AGW \
    -n appGatewayBackendPool \
    --add backendAddresses ipAddress=$ip
done

# Show public IP
az network public-ip show -g $RG -n $PIP --query ipAddress -o tsv
```
