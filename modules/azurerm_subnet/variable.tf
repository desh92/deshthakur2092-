variable "subnet_name" {
  description = "name of the subnet"
  type = string
}
variable "resource_group_name" {
  description = "name of the rg"
  type = string
}
variable "virtual_network_name" {
  description = "name of the vnet"
  type = string
}
variable "address_prefixes" {
  description = "address of the address prefixes"
  type = list(string)
}