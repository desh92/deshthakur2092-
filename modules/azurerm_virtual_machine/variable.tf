variable "nic_name" {
  description = "name of the nic"
  type = string
}
variable "location" {
  description = "location of the rg"
  type = string
}
variable "resource_group_name" {
  description = "name of the resource group"
  type = string 
}
variable "vm_name" {
  description = "name of the virtual machine"
  type = string
}
variable "admin_username" {
  description = "admin username for the VM"
  type        = string
  
}
variable "admin_password" {
  description = "admin password for the VM"
  type        = string
  sensitive   = true
  
}
variable "image_publisher" {
  description = "publisher of the image"
  type = string
  default     = "Canonical"
}
variable "image_offer" {
  description = "offer of the image"
  type = string
  default     = "0001-com-ubuntu-server-jammy"
}
variable "image_sku" {
  description = "sku of the image"
  type = string
  default     = "22_04-lts"
}
variable "virtual_network_name" {
  description = "name of the vnet"
  type = string
}
variable "subnet_name" {
  description = "name of the backend subnet data"
  type = string
}
variable "pip_name" {
  description = "name of the frontend pip"
  type = string
}

