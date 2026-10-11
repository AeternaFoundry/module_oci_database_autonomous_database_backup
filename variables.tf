variable "database_autonomous_database_backups" {
  description = <<EOT
Map of database_autonomous_database_backups, attributes below
Required:
    - autonomous_database_id
Optional:
    - display_name
    - is_long_term_backup
    - retention_period_in_days
    - backup_destination_details (block):
        - backup_retention_policy_on_terminate (optional)
        - id (optional)
        - internet_proxy (optional)
        - is_remote (optional)
        - is_retention_lock_enabled (optional)
        - remote_region (optional)
        - type (required)
        - vpc_password (optional)
        - vpc_user (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    autonomous_database_id   = string
    display_name             = optional(string)
    is_long_term_backup      = optional(bool)
    retention_period_in_days = optional(number)
    backup_destination_details = optional(object({
      backup_retention_policy_on_terminate = optional(string)
      id                                   = optional(string)
      internet_proxy                       = optional(string)
      is_remote                            = optional(bool)
      is_retention_lock_enabled            = optional(bool)
      remote_region                        = optional(string)
      type                                 = string
      vpc_password                         = optional(string)
      vpc_user                             = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

