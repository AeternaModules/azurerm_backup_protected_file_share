output "backup_protected_file_shares" {
  description = "All backup_protected_file_share resources"
  value       = azurerm_backup_protected_file_share.backup_protected_file_shares
}
output "backup_protected_file_shares_backup_policy_id" {
  description = "List of backup_policy_id values across all backup_protected_file_shares"
  value       = [for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : v.backup_policy_id]
}
output "backup_protected_file_shares_recovery_vault_name" {
  description = "List of recovery_vault_name values across all backup_protected_file_shares"
  value       = [for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : v.recovery_vault_name]
}
output "backup_protected_file_shares_resource_group_name" {
  description = "List of resource_group_name values across all backup_protected_file_shares"
  value       = [for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : v.resource_group_name]
}
output "backup_protected_file_shares_source_file_share_name" {
  description = "List of source_file_share_name values across all backup_protected_file_shares"
  value       = [for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : v.source_file_share_name]
}
output "backup_protected_file_shares_source_storage_account_id" {
  description = "List of source_storage_account_id values across all backup_protected_file_shares"
  value       = [for k, v in azurerm_backup_protected_file_share.backup_protected_file_shares : v.source_storage_account_id]
}

