variable "law_name" {
  description = "The name of the log analytics workspace"
  type        = string
}

variable "law_workspace_id" {
  description = "The workspace_id of the log analytics workspace"
  type        = string
}

variable "location" {
  description = "The location for this resource to be put in"
  type        = string
}

variable "plan" {
  description = "The plan you wish to build the solution for"
  type        = map(any)
}

variable "rg_name" {
  description = "The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists"
  type        = string
  validation {
    condition     = length(var.rg_name) > 1 && length(var.rg_name) <= 24
    error_message = "Resource group name is not valid."
  }
}

variable "solution_name" {
  description = "The name of the log analytics solution"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}
