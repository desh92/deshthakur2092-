variable "pip_name" {
  description = "name of the public IP"
  type        = string
}
variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
  
}
variable "location" {
  description = "location of the rg"
  type = string
}
variable "allocation_method" {
  description = "allocation method for the public IP"
  type        = string
  default     = "Static"
  
}