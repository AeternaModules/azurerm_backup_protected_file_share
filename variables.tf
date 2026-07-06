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
  # --- Unconfirmed validation candidates, derived from azurerm_backup_protected_file_share's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: recovery_vault_name
  #   source:    recoveryServicesValidate.RecoveryServicesVaultName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: source_storage_account_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: source_storage_account_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: source_file_share_name
  #   source:    [from validate.StorageShareName] !regexp.MustCompile(`^[0-9a-z-]+$`).MatchString(value)
  # path: source_file_share_name
  #   source:    [from validate.StorageShareName] len(value) < 3 || len(value) > 63
  # path: source_file_share_name
  #   source:    [from validate.StorageShareName] regexp.MustCompile(`^-`).MatchString(value)
  # path: source_file_share_name
  #   source:    [from validate.StorageShareName] regexp.MustCompile(`[-]{2,}`).MatchString(value)
  # path: backup_policy_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: backup_policy_id
  #   source:    [from azure.ValidateResourceID] err != nil
}

