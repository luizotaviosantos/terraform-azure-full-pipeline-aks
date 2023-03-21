resource "azurerm_dns_zone" "dns_zone" {
  name                = var.dns_zone
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_a_record" "wildcard_record" {
  name                = "*"
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = ["${var.public_ip_aks}"]
  
  depends_on = [
    var.depends_aks
  ]  

}