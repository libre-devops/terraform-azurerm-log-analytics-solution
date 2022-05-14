```hcl
module "law" {
  source = "registry.terraform.io/libre-devops/log-analytics-workspace/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags

  create_new_workspace       = true
  law_name                   = "law-${var.short}-${var.loc}-${terraform.workspace}-01"
  law_sku                    = "PerNode"
  retention_in_days          = "30"
  daily_quota_gb             = "0.5"
  internet_ingestion_enabled = false
  internet_query_enabled     = false
}

module "law_solution" {
  source = "registry.terraform.io/libre-devops/log-analytics-solution/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags

  solution_name    = "ContainerInsights"
  law_workspace_id = module.law.law_workspace_id
  law_name         = module.law.law_name

  settings = {
    plan = {
      publisher = "Microsoft"
      product   = "OMSGallery/ContainerInsights"
    }
  }
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_solution.law_solution](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_law_name"></a> [law\_name](#input\_law\_name) | The name of the log analytics workspace | `string` | n/a | yes |
| <a name="input_law_workspace_id"></a> [law\_workspace\_id](#input\_law\_workspace\_id) | The workspace\_id of the log analytics workspace | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location for this resource to be put in | `string` | n/a | yes |
| <a name="input_plan"></a> [plan](#input\_plan) | The plan you wish to build the solution for | `map(any)` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | The name of the log analytics solution | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_law_solution_id"></a> [law\_solution\_id](#output\_law\_solution\_id) | The ID of the log analytics workspace |
| <a name="output_law_solution_name"></a> [law\_solution\_name](#output\_law\_solution\_name) | The name of the solution |
| <a name="output_law_solution_plan"></a> [law\_solution\_plan](#output\_law\_solution\_plan) | The plan block of the solution plan |
