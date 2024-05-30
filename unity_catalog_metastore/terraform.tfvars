region                      = "us-west-2"                                    // AWS region where you want to deploy your resources                           // CIDR block for the workspace VPC, will be divided in two equal sized subnets
unity_metastore_owner          = "juandiego.vargasrosales@databricks.com"                            // Metastore Owner and Admin
databricks_account_id       = "0d26daa6-5e44-4c97-a497-ef015f91254a"                   // Databricks Account ID
client_id        = "71110d82-a85c-4d3b-8191-0cf87770623d"             // Databricks Service Principal Client ID
client_secret    = "dose725387a83d4a0036894f0e158ed49a61"         // Databricks Service Principal Client Secret
metastore_name = "juandiego_uc_metastore"
#workspace_name              = "YOUR_DATABRICKS_WORKSPACE_NAME"               // Databricks Workspace Name - IF NOT PROVIDED or EMPTY it will defauly to a random "demo-<number>" prefix
