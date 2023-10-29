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

output "id" {
  value       = azurerm_network_interface.network_interface.id
  description = "The ID of the Network Interface."
}

output "applied_dns_servers" {
  value       = azurerm_network_interface.network_interface.applied_dns_servers
  description = "If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set."
}

output "internal_domain_name_suffix" {
  value       = azurerm_network_interface.network_interface.internal_domain_name_suffix
  description = "Even if internal_dns_name_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal_domain_name_suffix."
}

output "mac_address" {
  value       = azurerm_network_interface.network_interface.mac_address
  description = "The Media Access Control (MAC) Address of the Network Interface."
}

output "private_ip_address" {
  value       = azurerm_network_interface.network_interface.private_ip_address
  description = "The first private IP address of the network interface."
}

output "private_ip_addresses" {
  value       = azurerm_network_interface.network_interface.private_ip_addresses
  description = "The private IP addresses of the network interface."
}

output "virtual_machine_id" {
  value       = azurerm_network_interface.network_interface.virtual_machine_id
  description = "The ID of the Virtual Machine which this Network Interface is connected to."
}
