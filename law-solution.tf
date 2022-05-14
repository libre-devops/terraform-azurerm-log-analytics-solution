resource "azurerm_log_analytics_solution" "law_solution" {
  solution_name         = var.solution_name
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = var.law_workspace_id
  workspace_name        = var.law_name
  tags                  = var.tags

  dynamic "plan" {
    for_each = lookup(var.settings, "plan", {}) != {} ? [1] : []
    content {
      product        = lookup(var.settings.plan, "product", null)
      publisher      = lookup(var.settings.plan, "publisher", null)
      promotion_code = lookup(var.settings.plan, "promotion_code", null)
    }
  }
}