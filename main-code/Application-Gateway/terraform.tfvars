appgw = {
  appgw_rg_name             = "rg-appgw-prod-ci-01"
  appgw_location            = "centralindia"
  appgw_vnet_name           = "vnet-appgw-prod-ci-01"
  appgw_address_space       = ["10.254.0.0/16"]
  appgw_subnet_name         = "subnet-appgw-prod-ci-01"
  appgw_address_prefixes    = ["10.254.0.0/24"]
  appgw_pip                 = "pip-appgw-prod-ci-01"
  appgw_name                = "appgw-prod-ci-01"
  appgw_config_ip_name      = "ipconfig-appgw-prod-ci-01"
  frontend_port_name        = "frontend-appgw-prod-ci-01"
  frontend_port             = 80
  frontend_ip_config_name   = "frontend-ipname-appgw-prod-ci-01"
  backend_address_pool_name = "bkpool-appgw-prod-ci-01"
  http_setting_name         = "http-appgw-prod-ci-01"
  listener_name             = "listner-appgw-prod-ci-01"
  request_routing_rule_name = "lis-rule-appgw-prod-ci-01"
  routing_priority          = 9
}