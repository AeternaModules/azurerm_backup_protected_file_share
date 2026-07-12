output "backup_protected_file_shares_backup_policy_id" {
  description = "Map of backup_policy_id values across all backup_protected_file_shares, keyed the same as var.backup_protected_file_shares"
  value       = { for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : k => v.backup_policy_id }
}
output "backup_protected_file_shares_recovery_vault_name" {
  description = "Map of recovery_vault_name values across all backup_protected_file_shares, keyed the same as var.backup_protected_file_shares"
  value       = { for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : k => v.recovery_vault_name }
}
output "backup_protected_file_shares_resource_group_name" {
  description = "Map of resource_group_name values across all backup_protected_file_shares, keyed the same as var.backup_protected_file_shares"
  value       = { for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : k => v.resource_group_name }
}
output "backup_protected_file_shares_source_file_share_name" {
  description = "Map of source_file_share_name values across all backup_protected_file_shares, keyed the same as var.backup_protected_file_shares"
  value       = { for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : k => v.source_file_share_name }
}
output "backup_protected_file_shares_source_storage_account_id" {
  description = "Map of source_storage_account_id values across all backup_protected_file_shares, keyed the same as var.backup_protected_file_shares"
  value       = { for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : k => v.source_storage_account_id }
}

