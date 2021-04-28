
data "aws_region" "current" {}

locals {
  id                = var.name
  ssh_enabled       = var.all_enabled ? true : var.ssh_enabled
  api_enabled       = var.all_enabled ? true : var.api_enabled
  validator_enabled = var.all_enabled ? true : var.validator_enabled
}

variable "network_settings" {
  description = "Map of network settings to apply. Use either this or set individual variables."
  type = map(object({
    name                = string
    shortname           = string
    api_health          = string
    polkadot_prometheus = string
    json_rpc            = string
    ws_rpc              = string
  }))
  default = null
}

// If the network map is not supplied, fall back to running on supplied ports which
// default to polkadot.
locals {
  network_settings = var.network_settings == null ? { network = {
    name                = var.network_name
    shortname           = var.network_stub
    api_health          = var.health_check_port
    polkadot_prometheus = var.polkadot_prometheus_port
    json_rpc            = var.rpc_api_port
    ws_rpc              = var.wss_api_port
  } } : var.network_settings
}

variable "network_name" {
  description = "The network name, ie kusama / mainnet"
  type        = string
  default     = "kusama"
}

variable "network_stub" {
  description = "The stub name of the Polkadot chain (polkadot = polkadot, kusama = ksmcc3)"
  type        = string
  default     = "ksmcc3"
}

variable "rpc_api_port" {
  description = "Port number for the JSON RPC API"
  type        = string
  default     = "9934"
}

variable "wss_api_port" {
  description = "Port number for the Websockets API"
  type        = string
  default     = "9945"
}

variable "health_check_port" {
  description = "Port number for the health check"
  type        = string
  default     = "5501"
}

variable "polkadot_prometheus_port" {
  description = "Port number for the Prometheus Metrics exporter built into the Polkadot client"
  type        = string
  default     = "9610"
}

########
# Label
########
variable "name" {
  description = "The name of the deployment"
  type        = string
  default     = "polkadot-api"
}

variable "id" {
  description = "A unique identifier for the deployment"
  type        = string
  default     = ""
}

variable "tags" {
  description = "The tags of the deployment"
  type        = map(string)
  default     = {}
}



##################
# Security Groups
##################
variable "all_enabled" {
  description = "Bool to enable all the security groups"
  type        = bool
  default     = false
}

variable "ssh_inbound_cidr_blocks" {
  description = "The corporate IP you want to restrict ssh traffic to"
  type        = string
  default     = "0.0.0.0/0"
}

variable "api_enabled" {
  description = "Boolean to allow api related traffic"
  type        = bool
  default     = false
}

variable "validator_enabled" {
  description = "Boolean to allow validator related traffic"
  type        = bool
  default     = false
}

variable "api_sg_name" {
  description = "Name for the api security group"
  type        = string
  default     = "api-sg"
}

variable "validator_sg_name" {
  description = "Name for the validator security group"
  type        = string
  default     = "validator-sg"
}
variable "ssh_enabled" {
  description = "Boolean to enable a ssh access.  All ssh traffic restricted to ssh_cidr_blocks"
  type        = bool
  default     = false
}

