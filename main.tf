resource "oci_database_autonomous_database_backup" "database_autonomous_database_backups" {
  for_each = var.database_autonomous_database_backups

  autonomous_database_id   = each.value.autonomous_database_id
  display_name             = each.value.display_name
  is_long_term_backup      = each.value.is_long_term_backup
  retention_period_in_days = each.value.retention_period_in_days

  dynamic "backup_destination_details" {
    for_each = each.value.backup_destination_details != null ? [each.value.backup_destination_details] : []
    content {
      backup_retention_policy_on_terminate = backup_destination_details.value.backup_retention_policy_on_terminate
      id                                   = backup_destination_details.value.id
      internet_proxy                       = backup_destination_details.value.internet_proxy
      is_remote                            = backup_destination_details.value.is_remote
      is_retention_lock_enabled            = backup_destination_details.value.is_retention_lock_enabled
      remote_region                        = backup_destination_details.value.remote_region
      type                                 = backup_destination_details.value.type
      vpc_password                         = backup_destination_details.value.vpc_password
      vpc_user                             = backup_destination_details.value.vpc_user
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

