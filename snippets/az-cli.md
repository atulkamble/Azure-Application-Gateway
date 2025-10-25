# Azure CLI snippets for Application Gateway

## Create RG, VNet, Subnet, Public IP
```bash
az group create -n agw-demo-rg -l eastus
az network vnet create -g agw-demo-rg -n agw-vnet \
  --address-prefixes 10.0.0.0/16 \
  --subnet-name appgw-subnet --subnet-prefixes 10.0.1.0/24
az network public-ip create -g agw-demo-rg -n agw-pip --sku Standard --allocation-method Static
```

## Create Standard_v2 gateway (HTTP)
```bash
az network application-gateway create -g agw-demo-rg -n agw-demo \
  --sku Standard_v2 \
  --public-ip-address agw-pip \
  --vnet-name agw-vnet --subnet appgw-subnet \
  --frontend-port 80 \
  --http-settings-protocol Http --http-settings-port 80
```

## Add backend addresses
```bash
az network application-gateway address-pool update \
  -g agw-demo-rg --gateway-name agw-demo \
  -n appGatewayBackendPool \
  --add backendAddresses ipAddress=10.0.2.4
```

## Create HTTPS listener and upload cert (PFX)
```bash
az network application-gateway ssl-cert add \
  -g agw-demo-rg --gateway-name agw-demo \
  -n site-cert --cert-file ./site.pfx --cert-password "<PFX_PASSWORD>"

az network application-gateway frontend-port create \
  -g agw-demo-rg --gateway-name agw-demo -n port443 --port 443

az network application-gateway http-listener create \
  -g agw-demo-rg --gateway-name agw-demo \
  -n listener-https \
  --frontend-ip appGatewayFrontendIP \
  --frontend-port port443 \
  --ssl-cert site-cert --host-name example.contoso.com
```

## Create path-based rule
```bash
az network application-gateway url-path-map create \
  -g agw-demo-rg --gateway-name agw-demo \
  -n pathmap \
  --default-address-pool appGatewayBackendPool \
  --default-http-settings appGatewayBackendHttpSettings

az network application-gateway url-path-map rule create \
  -g agw-demo-rg --gateway-name agw-demo \
  --path-map-name pathmap -n web-path \
  --paths / \
  --address-pool webPool \
  --http-settings webHttp

az network application-gateway url-path-map rule create \
  -g agw-demo-rg --gateway-name agw-demo \
  --path-map-name pathmap -n api-path \
  --paths /api/* \
  --address-pool apiPool \
  --http-settings apiHttp
```
