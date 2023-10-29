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
  ip_configuration {
    name                                               = var.ip_configuration.name
    gateway_load_balancer_frontend_ip_configuration_id = var.ip_configuration.gateway_load_balancer_frontend_ip_configuration_id
    subnet_id                                          = var.ip_configuration.subnet_id
    private_ip_address_version                         = var.ip_configuration.private_ip_address_version
    private_ip_address_allocation                      = var.ip_configuration.private_ip_address_allocation
    public_ip_address_id                               = var.ip_configuration.public_ip_address_id
    primary                                            = var.ip_configuration.primary
    private_ip_address                                 = var.ip_configuration.private_ip_address
  }
}
