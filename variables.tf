// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

variable "ip_configuration" {
  type = list(object({
    name                                               = string
    gateway_load_balancer_frontend_ip_configuration_id = optional(string)
    subnet_id                                          = optional(string)
    private_ip_address_version                         = optional(string)
    private_ip_address_allocation                      = string
    public_ip_address_id                               = optional(string)
    primary                                            = optional(bool)
    private_ip_address                                 = optional(string)
  }))
  description = "List containining the IP Configuration for the Network Interface."
}

variable "name" {
  type        = string
  description = "(Required) The name of the Network Interface. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Network Interface. Changing this forces a new resource to be created."
}

variable "dns_servers" {
  type        = list(string)
  description = "(Optional) A list of DNS servers IP addresses to associate with the NIC. Use 'AzureProvidedDNS' to switch to Azure provided DNS resolution."
  default     = []
}

variable "edge_zone" {
  type        = string
  description = "(Optional) Specifies the Edge Zone where the resource should be created. Changing this forces a new resource to be created."
  default     = null
}

variable "enable_ip_forwarding" {
  type        = bool
  description = "(Optional) Should IP forwarding be enabled on this NIC? Defaults to false."
  default     = false
}

variable "enable_accelerated_networking" {
  type        = bool
  description = "(Optional) Should accelerated networking be enabled on this NIC? Defaults to false."
  default     = false
}

variable "internal_dns_name_label" {
  type        = string
  description = "(Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
