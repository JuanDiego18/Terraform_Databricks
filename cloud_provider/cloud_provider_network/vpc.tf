module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"


  name = local.prefix

  #DNS

  enable_dns_hostnames = true

  #Availability Zones

  azs=data.aws_availability_zones.available.names

  # The IPv4 CIDR block for the VPC. 

  cidr=var.cidr_block

  # Subnets
  public_subnets = [cidrsubnet(var.cidr_block, 3, 0)]
  private_subnets = [cidrsubnet(var.cidr_block, 3, 1),
  cidrsubnet(var.cidr_block, 3, 2)]

  #INTERNET GATEWAY:Allows communication between the VPC and the internet. 

  create_igw=true

  #NAT GATEWAYS: Allows the private subnets to have outbound access to the internet
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  #Route tables
  manage_default_route_table = true

  #NACL Network Access Control Lists
  manage_default_network_acl = true

  #Security groups
  manage_default_security_group = true
  default_security_group_name = "${local.prefix}-sg"
  default_security_group_egress = [{
    cidr_blocks = "0.0.0.0/0"
  }]
  default_security_group_ingress = [{
    description = "Allow all internal TCP and UDP"
    self        = true
  }]

}