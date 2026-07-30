data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each                   = var.key_vaults
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = try(each.value.sku_name, "standard")
  soft_delete_retention_days = try(each.value.soft_delete_retention_days, 7)
  purge_protection_enabled   = try(each.value.purge_protection_enabled, false)

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = try(each.value.key_permissions, [
      "Get", "List", "Create", "Delete", "Update", "Recover"
    ])

    secret_permissions = try(each.value.secret_permissions, [
      "Get", "List", "Set", "Delete", "Purge", "Recover"  
    ])
  }
}
