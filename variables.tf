variable "vsphere_server" {
  description = "Address of the vsphere server on which to provision vms"
}

variable "vsphere_user" {
  description = "vsphere user name"
  default = "root"
}

variable "vsphere_password" {
  description = "vsphere password for the account given above"
}

variable "vsphere_datacenter" {
  description = "vSphere Datacenter in which virtual machine should be created"
}

variable "vsphere_datastore" {
  description = "vSphere datastore to use"
}

variable "vsphere_compute_cluster" {
  description = "vSphere compute cluster to use"
}

variable "vsphere_network" {
  description = "vSphere network to use"
}

variable "ssh_user" {
  description = "User ID to use for connecting via ssh - must be present in image"
}

variable "ssh_password" {
  description = "Password to the ssh_user account"
}

variable "hostname" {
  description = "Hostname for virtual machine"
}

variable "domain" {
  description = "Domain name for this virtual machine"
}

variable "ipv4_address" {
  description = "IP address to use for primary network interface"
  default = ""
}

variable "ipv4_netmask" {
  description = "Netmask to use for primary network interface"
  default = ""
}

variable "ipv4_gateway" {
  description = "Network gateway to use for primary network interface"
  default = ""
}

variable "num_cpus" {
  description = "Number of virtual CPUs"
}

variable "memory_mb" {
  description = "Memory (in MB) for manager node"
}

variable "root_volume_size" {
  description = "The size of the root volume in gigabytes."
}

variable "disk_template" {
  description = "vSphere template to use as a disk template"
}
