resource "azurerm_resource_group" "redirector_rg" {
  name     = "redirector_resource_group"
  location = "West US"
}

resource "azurerm_cdn_profile" "redirector_cdn_profile" {
  name                = "redirector-cdn-profile"
  location            = azurerm_resource_group.redirector_rg.location
  resource_group_name = azurerm_resource_group.redirector_rg.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "redirector_endpoint" {
  name                = var.redirector_name
  profile_name        = azurerm_cdn_profile.redirector_cdn_profile.name
  location            = azurerm_resource_group.redirector_rg.location
  resource_group_name = azurerm_resource_group.redirector_rg.name
  origin_host_header  = var.c2_domain

  origin {
    name       = var.sub_domain
    host_name  = var.c2_domain
    http_port  = var.c2_port_http
    https_port = var.c2_port_https
  }
}
