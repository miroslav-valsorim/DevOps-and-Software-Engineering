variable "resource_group_name" {
  type        = string
  description = "Name of the resource grp"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource grp"
}

variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan name"
}

variable "app_service_name" {
  type        = string
  description = "Application service name"
}

variable "sql_server_name" {
  type        = string
  description = "Database server name"
}

variable "sql_database_name" {
  type        = string
  description = "Database name"
}

variable "sql_admin_login" {
  type        = string
  description = "Admin Login Credentials"
}

variable "sql_admin_password" {
  type        = string
  description = "Admin Login Credentials"
}

variable "firewall_rule_name" {
  type        = string
  description = "Firewall rule"
}

variable "github_repo_URL" {
  type        = string
  description = "Link to Github repo"
}