output "application_gateway_id" {
  description = "Resource ID of the Application Gateway"
  value       = azurerm_application_gateway.agw.id
}

output "public_ip" {
  description = "Public IP address of the gateway"
  value       = azurerm_public_ip.pip.ip_address
}
