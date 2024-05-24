variable "network_configs" {
  description = "Management zone config"
  type = object({
    cloud_nat = map(object({
      project_id                          = string
      region                              = string
      name                                = string
      router                              = string
      enable_dynamic_port_allocation      = optional(bool, true)
      enable_endpoint_independent_mapping = optional(bool, false)
      min_ports_per_vm                    = optional(number)
      max_ports_per_vm                    = optional(number)
      log_config_enable                   = optional(bool, true)
      log_config_filter                   = optional(string)
    }))
    vpc = optional(map(object({
      project_id                             = string
      name                                   = string
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
      routers = optional(map(object({
        name   = string
        region = string

      })), {})
    })), {})
  })
}