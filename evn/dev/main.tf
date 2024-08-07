module "resource_group_module" {
  source = "../../main-code/resource_group"
  rg_map = var.rg_map
}

module "keyvault_module" {
  depends_on   = [module.resource_group_module]
  source       = "../../main-code/keyvault"
  keyvault_map = var.keyvault_map
}

module "virtual_network_module" {
  depends_on = [module.resource_group_module]
  source     = "../../main-code/virtual-network"
  vnet_map   = var.vnet_map
}

module "peering_module" {
  depends_on = [module.virtual_network_module]
  source     = "../../main-code/peering"
  peering_map   = var.peering_map
}

module "subnet_module" {
  depends_on = [module.virtual_network_module]
  source     = "../../main-code/subnet"
  subnet_map = var.subnet_map
  }

module "bation_module" {
  depends_on  = [module.virtual_network_module]
  source      = "../../main-code/Bastion"
  bastion_map = var.bastion_map
  
}

module "linux_vm_module" {
  source       = "../../main-code/Linux-Virtual-Machine"
  Linux_vm_map = var.Linux_vm_map
  depends_on   = [module.subnet_module]
}

module "windows_vm_module" {
  source     = "../../main-code/Windows-Virtual-Machine"
  win_vm_map = var.win_vm_map
  depends_on = [module.subnet_module]
}

module "lb_module" {
  depends_on = [module.linux_vm_module, module.windows_vm_module]
  source     = "../../main-code/Load-Balancer"
  lb_map = var.lb_map
  }



module "database_module" {
  source     = "../../main-code/database"
  db_map     = var.db_map
  depends_on = [module.resource_group_module]
}
