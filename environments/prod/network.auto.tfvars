
network_configs = {
  cloud_nat = {
    devops-prod-uc1 = {
      project_id = "prj-appcode-mgz-prod-5904"
      router     = "router-devops-prod-uc1"
      name       = "nat-devops-prod-uc1"
      region     = "us-central1"
    }
  }
  vpc = {
    devops-prod = {
      project_id                             = "prj-appcode-mgz-prod-5904"
      name                                   = "vpc-devops-prod"
      routing_mode                           = "GLOBAL"
      delete_default_internet_gateway_routes = true
      shared_vpc_host                        = true
      subnets = [
        {
          subnet_name               = "subnet-devops-prod-uc1",
          subnet_ip                 = "10.2.2.0/24",
          subnet_region             = "us-central1",
          subnet_private_access     = "true"
          subnet_flow_logs          = "true"
          subnet_flow_logs_interval = "INTERVAL_30_SEC"
          subnet_flow_logs_sampling = 0.1
          subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
        }
      ]
      secondary_ranges = {
        subnet-devops-uc1 = [
          {
            range_name    = "secrange-devops-prod-uc1"
            ip_cidr_range = "100.94.0.0/16"
          }
        ]
      }
      routers = {
        uc1 = {
          name   = "router-devops-prod-uc1"
          region = "us-central1"
        }
      }
    }
  }
}

