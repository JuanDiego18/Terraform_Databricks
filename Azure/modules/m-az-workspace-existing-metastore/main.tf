module "my_adb_lakehouse" {
  source                = "./modules/adb-lakehouse"
  prefix                          = var.prefix
  environment_name                = var.environment_name
  location                        = var.location
  spoke_vnet_address_space        = var.spoke_vnet_address_space
  use_existing_resource_group     = var.use_existing_resource_group
  managed_resource_group_name     = var.managed_resource_group_name
  databricks_workspace_name       = "${var.prefix}-workspace"
  dbfsname = var.dbfsname
  private_subnet_address_prefixes = [cidrsubnet(var.spoke_vnet_address_space, 3, 0)]
  public_subnet_address_prefixes  = [cidrsubnet(var.spoke_vnet_address_space, 3, 1)]
  tags = var.tags
}

module "metastore_assignment" {
  source                = "./modules/adb-uc-metastore-assignment"
  workspace_id                = module.my_adb_lakehouse.workspace_id
  metastore_id = var.metastore_id
}