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

variable "tags" {
    default = {}
}

variable "region" {
    type = string
    default = "us-west-2"
    description = "AWS region to deploy to"
}

variable "prefix" {
  default     = "juandiego"
  type        = string
  description = "Prefix for use in the generated names"
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = var.prefix != "" ? var.prefix : "juandiego${random_string.naming.result}"
  metastore_name = var.metastore_name == null ? "${var.prefix}-metastore" : var.metastore_name
}

variable "metastore_name" {
  description = "(Optional) Name of the metastore that will be created"
  type        = string
  default     = null
}

variable "unity_metastore_owner" {
  description = "(Required) Name of the principal that will be the owner of the Metastore"
  type        = string
}