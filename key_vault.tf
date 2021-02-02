

#data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_enabled             = var.soft_delete_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled


  sku_name = var.sku_name

  access_policy {
    tenant_id = var.tenant_id #data.azurerm_client_config.current.tenant_id
    object_id = var.object_id #data.azurerm_client_config.current.object_id

    key_permissions         = var.kv_key_permissions_full
    secret_permissions      = var.kv_secret_permissions_full
    storage_permissions     = var.kv_storage_permissions_full
    certificate_permissions = var.kv_certificate_permissions_full

  }
}


