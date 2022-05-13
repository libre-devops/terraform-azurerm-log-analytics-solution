resource "azurerm_log_analytics_solution" "law_solution" {
  solution_name         = var.solution_name
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = var.law_workspace_id
  workspace_name        = var.law_name
  tags                  = var.tags

  dynamic "plan" {
    for_each = var.plan
    content {
      product        = lookup(plan.value, "product", null)
      publisher      = lookup(plan.value, "publisher", null)
      promotion_code = lookup(plan.value, "promotion_code", null)
    }
  }
}