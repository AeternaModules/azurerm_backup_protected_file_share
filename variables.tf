variable "backup_protected_file_shares" {
  description = <<EOT
Map of backup_protected_file_shares, attributes below
Required:
    - backup_policy_id
    - recovery_vault_name
    - resource_group_name
    - source_file_share_name
    - source_storage_account_id
EOT

  type = map(object({
    backup_policy_id          = string
    recovery_vault_name       = string
    resource_group_name       = string
    source_file_share_name    = string
    source_storage_account_id = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.backup_protected_file_shares : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.backup_protected_file_shares : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.backup_protected_file_shares : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

