##################################################################################
# VARIABLES
##################################################################################

variable "name" {}

variable "location" {}

variable "resource_group_name" {}

variable "tenant_id" {}

variable "object_id" {}

##################################################################################
# LOCALS
##################################################################################

locals {
  env_name = lower(terraform.workspace)

  common_tags = {
    Environment = local.env_name
    Name        = var.name
  }
}