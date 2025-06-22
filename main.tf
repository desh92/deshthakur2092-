module "resource_group" {
  source = "../modules/azurerm_resource_group"

  resource_group_name = "deshrg"
  location            = "Centralindia"
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../modules/azurerm_virtual_network"

  virtual_network_name = "deshvnet"
  resource_group_name  = "deshrg"
  location             = "Centralindia"
  address_space        = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  subnet_name          = "frontend-deshsubnet"
  resource_group_name  = "deshrg"
  virtual_network_name = "deshvnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  subnet_name          = "backend-deshsubnet"
  resource_group_name  = "deshrg"
  virtual_network_name = "deshvnet"
  address_prefixes     = ["10.0.2.0/24"]
}

module "frontend-pip" {
  depends_on = [ module.resource_group ]
  source = "../modules/azurerm_public_ip"

  pip_name = "frontend-deshpip"
  location = "West US"
  resource_group_name = "deshrg"
  allocation_method = "Static"
}

module "backend-pip" {
  depends_on = [ module.resource_group ]
  source = "../modules/azurerm_public_ip"

  pip_name = "backend-deshpip"
  location = "West US"
  resource_group_name = "deshrg"
  allocation_method = "Static"
}

module "frontend-vm" {
  depends_on = [ module.frontend-pip, module.frontend_subnet ]
  source = "../modules/azurerm_virtual_machine"

  nic_name = "desh-fe-nic"
  location = "Centralindia"
  resource_group_name = "deshrg"
  vm_name = "frontend-deshvm"
  admin_username = "deshadmin"
  admin_password = "desh@admin1234"
  image_publisher = "canonical"
  image_offer = "ubuntu-24_10"
  image_sku = "server-gen1"
  virtual_network_name = "deshvnet"
  subnet_name = "frontend-deshsubnet"
  pip_name = "frontend-deshpip"
}

module "backend-vm" {
  depends_on = [ module.backend_subnet, module.backend-pip ]
  source = "../modules/azurerm_virtual_machine"

  nic_name = "desh-be-nic"
  location = "Centralindia"
  resource_group_name = "deshrg"
  vm_name = "backend-deshvm"
  admin_username = "deshadmin"
  admin_password = "desh@admin12345"
  image_publisher = "Canonical"
  image_offer = "0001-com-ubuntu-server-focal"
  image_sku = "20_04-lts"
  virtual_network_name = "deshvnet"
  subnet_name = "backend-deshsubnet"
  pip_name = "backend-deshpip"
}

module "sql-server" {
  depends_on = [ module.resource_group ]
  source = "../modules/azurerm_sql_server"

  sql_server_name = "deshsqlserver"
  resource_group_name = "deshrg"
  location = "Centralindia"
}


module "database" {
  depends_on = [ module.sql-server ]
  source = "../modules/azurerm_database"

  sql_database_name = "deshdb"
  sql_server_name = "deshsqlserver"
  resource_group_name = "deshrg"
}