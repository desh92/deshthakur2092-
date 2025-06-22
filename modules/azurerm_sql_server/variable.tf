variable "sql_server_name" {
  description = "The name of the SQL Server"
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the SQL Server will be created"
  type        = string
  
}
variable "location" {
  description = "The Azure location where the SQL Server will be created"
  type        = string
}