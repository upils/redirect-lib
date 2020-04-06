output "redirector_url" {
  value = "${azurerm_cdn_endpoint.redirector_endpoint.name}.azureedge.net"
}
