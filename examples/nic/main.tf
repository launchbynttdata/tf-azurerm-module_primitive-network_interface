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

module "nic" {

  source = "../.."

  name                          = local.nic_name
  location                      = var.location
  resource_group_name           = local.resource_group_name
  dns_servers                   = var.dns_servers
  edge_zone                     = var.edge_zone
  ip_configuration              = local.ip_configuration
  tags                          = var.tags
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label
  enable_ip_forwarding          = var.enable_ip_forwarding

  depends_on = [module.resource_group]
}


module "resource_group" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-resource_group.git?ref=1.0.0"

  name     = local.resource_group_name
  location = var.location
  tags = {
    resource_name = local.resource_group_name
  }
}


module "resource_names" {
  source = "git::https://github.com/launchbynttdata/tf-launch-module_library-resource_name.git?ref=1.0.0"

  for_each = var.resource_names_map

  region                  = join("", split("-", var.location))
  class_env               = var.class_env
  cloud_resource_type     = each.value.name
  instance_env            = var.instance_env
  instance_resource       = var.instance_resource
  maximum_length          = each.value.max_length
  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
}

module "virtual_network" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-virtual_network.git?ref=1.0.0"

  vnet_name           = local.virtual_network_name
  vnet_location       = var.location
  resource_group_name = local.resource_group_name
  address_space       = var.address_space
  subnet_names        = var.subnet_names
  subnet_prefixes     = var.subnet_prefixes
  use_for_each        = var.use_for_each

  depends_on = [module.resource_group]
}

module "public_ip" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-public_ip.git?ref=1.0.0"

  name                = local.public_ip_name
  location            = var.location
  resource_group_name = local.resource_group_name

  depends_on = [module.resource_group]
}
