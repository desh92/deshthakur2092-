variable "virtual_network_name" {
  description = "name of the vnet"
  type = string
}
variable "location" {
  description = "location of the vnet"
}
variable "resource_group_name" {
  description = "name of the rg"
  type = string
}
variable "address_space" {
  description = "value of the address space"
  type = list(string)
}