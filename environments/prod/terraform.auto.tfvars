devops_vpc = {
  project_id                             = "prj-appcode-mgz-prod-5904"
  network_name                           = "vpc-devops"
  routing_mode                           = "GLOBAL"
  delete_default_internet_gateway_routes = true
  subnets = [
    {
      subnet_name               = "subnet-devops-uc1",
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
        range_name    = "secrange-devops-uc1"
        ip_cidr_range = "100.94.0.0/16"
      }
    ]
  }
  shared_vpc_host = true
}

cloud_nat_devops_uc1 = "nat-devops-uc1"