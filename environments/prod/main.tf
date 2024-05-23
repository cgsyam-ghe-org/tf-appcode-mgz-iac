module "nat_devops_uc1" {
  source                              = "terraform-google-modules/cloud-nat/google"
  version                             = "~> 5.0.0"
  project_id                          = var.devops_vpc.project_id
  region                              = "us-central1"
  router                              = module.router_devops_uc1.router.name
  name                                = var.cloud_nat_devops_uc1
  enable_dynamic_port_allocation      = true
  enable_endpoint_independent_mapping = false
  min_ports_per_vm                    = 4096
  max_ports_per_vm                    = 65536
  log_config_enable                   = true
  log_config_filter                   = "ERRORS_ONLY"
}

module "router_devops_uc1" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 6.0"
  name    = "router-${var.cloud_nat_devops_uc1}"
  project = var.devops_vpc.project_id
  region  = "us-central1"
  network = module.devops_vpc.network_name
}

module "devops_vpc" {
  source                                 = "terraform-google-modules/network/google"
  version                                = "~> 9.1"
  project_id                             = var.devops_vpc.project_id
  network_name                           = var.devops_vpc.network_name
  routing_mode                           = var.devops_vpc.routing_mode
  shared_vpc_host                        = var.devops_vpc.shared_vpc_host
  delete_default_internet_gateway_routes = var.devops_vpc.delete_default_internet_gateway_routes
  subnets                                = var.devops_vpc.subnets
  secondary_ranges                       = var.devops_vpc.secondary_ranges
}