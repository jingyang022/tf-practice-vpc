# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "yap-vpc"
    cidr = "10.0.0.0/16"
    azs = data.aws_availability_zones.available.names

    public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

    map_public_ip_on_launch = true
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true

    public_subnet_tags = {
      "kubernetes.io/role/elb" = 1
      }

    private_subnet_tags = {
      "kubernetes.io/role/internal-elb" = 1
      }
}