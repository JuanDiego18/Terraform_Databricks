module "adb_workspace_basic" {
  # workspace variables
  source                          = "../modules/m-az-workspace-existing-metastore"
  prefix                          = var.prefix
  environment_name                = var.environment_name
  dbfsname = var.dbfsname
  location                        = var.location
  spoke_vnet_address_space        = var.spoke_vnet_address_space
  use_existing_resource_group     = var.spoke_resource_group_name
  managed_resource_group_name     = var.managed_resource_group_name
  databricks_workspace_name       = "${var.prefix}-workspace"
  private_subnet_address_prefixes = [cidrsubnet(var.spoke_vnet_address_space, 3, 0)]
  public_subnet_address_prefixes  = [cidrsubnet(var.spoke_vnet_address_space, 3, 1)]
  tags = {
    Owner : "andres.garcia@databricks.com"
    RemoveAfter : formatdate("YYYY-MM-DD", timeadd(timestamp(), "720h"))
  }

  # metastore variables
  metastore_id = var.metastore_id

  # providers
  providers = {
    databricks = databricks.mws
  }
}
