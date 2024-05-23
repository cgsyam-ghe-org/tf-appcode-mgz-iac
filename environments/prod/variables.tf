variable "devops_vpc" {
  description = "Properties of the Shared VPC network to be created"
  type = object({
    project_id                             = string
    network_name                           = string
    routing_mode                           = string
    delete_default_internet_gateway_routes = bool
    subnets = list(object(
      {
        subnet_name               = string,
        subnet_ip                 = string,
        subnet_region             = string,
        subnet_private_access     = string,
        subnet_flow_logs          = optional(string)
        subnet_flow_logs_interval = optional(string)
        subnet_flow_logs_sampling = optional(number)
        subnet_flow_logs_metadata = optional(string)
        purpose                   = optional(string)
        role                      = optional(string)
      })
    )
    secondary_ranges = map(list(object({ range_name = string, ip_cidr_range = string })))
    shared_vpc_host  = bool
  })
}

variable "cloud_nat_devops_uc1" {
  type        = string
  description = "Cloud NAT name"
}