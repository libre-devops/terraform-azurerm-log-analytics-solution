output "law_solution_id" {
  value       = azurerm_log_analytics_solution.law_solution.id
  description = "The ID of the log analytics workspace"
}

output "law_solution_name" {
  value       = azurerm_log_analytics_solution.law_solution.solution_name
  description = "The name of the solution"
}

output "law_solution_plan" {
  value       = azurerm_log_analytics_solution.law_solution.plan
  description = "The plan block of the solution plan"
}
