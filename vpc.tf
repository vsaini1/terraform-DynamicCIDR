#To create Dynamic subnet(cidrsubnet) for any Count(3 here) of AZs
provider "aws" {
  region = "us-east-1"
}

variables "vpc_cidr" {
  default = "192.169.0.0/16"
}
   
resource "aws_vpc" "main" {
   cidr_block       = "${var.vpc_cidr}"
   instance_tenancy = "default"

   tags = {
     Name = "NyNewVPC"
   }
}

resource "aws_subnet" "main" {
   count      = 3
   vpc_id     = "${aws_vpc.main.id}"
   cidr_block = "${cidrsubnet(var.vpc_cidr,8,count.index)
	
    tags = {
      Name = "Subnet-${count.index + 0}
     }
}

#It will generate(xxx.xxx."count.index".0/(default+8) 
#subnet-0 192.168.0.0/24
#subnet-1 192.168.1.0/24
#subnet-2 192.168.2.0/24
