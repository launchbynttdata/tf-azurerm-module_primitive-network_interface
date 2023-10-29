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

resource "azurerm_network_interface" "network_interface" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  auxiliary_mode                = var.auxillary_mode
  auxiliary_sku                 = var.auxiliary_sku
  dns_servers                   = var.dns_servers
  edge_zone                     = var.edge_zone
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label
  tags                          = var.tags

  dynamic "ip_configuration" {
    for_each = var.ip_configuration != null ? var.ip_configuration : []
    content {
      name                                               = ip_configuration.value.name
      gateway_load_balancer_frontend_ip_configuration_id = ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
      subnet_id                                          = ip_configuration.value.subnet_id
      private_ip_address_version                         = ip_configuration.value.private_ip_address_version
      private_ip_address_allocation                      = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id                               = ip_configuration.value.public_ip_address_id
      primary                                            = ip_configuration.value.primary
      private_ip_address                                 = ip_configuration.value.private_ip_address
    }
  }
}
