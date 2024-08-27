variable "client_id" {
    type = string
    description = "Application ID of the Service Principal"
}

variable "client_secret" {
    type = string
    description = "Secret of the Service Princiapl"
}

variable "databricks_account_id" {
    type = string
    description = "databricks account console id"
}

variable "workspace_id" {
  type        = string
}

variable "metastore_id" {
  type        = string
}