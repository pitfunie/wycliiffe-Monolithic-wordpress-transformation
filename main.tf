// Existing Terraform src code found at /var/folders/m6/qwblyr1d5txfbb_jr9n_sh_40000gn/T/terraform_src.

data "aws_region" "current" {}

locals {
  stack_name = "NYPets"
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.16.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "NYPETSVPC"
  }
}

resource "aws_ec2_capacity_block_reservation" "i_pv6_cidr_block" {
  capacity_block_offering_id = aws_vpc.vpc.arn
  // CF Property(AmazonProvidedIpv6CidrBlock) = true
}

resource "aws_internet_gateway" "internet_gateway" {
  tags = {
    Name = "NYPETS-IGW"
  }
}

resource "aws_vpn_gateway_attachment" "internet_gateway_attachment" {
  vpc_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table" "rt_pub" {
  vpc_id = aws_vpc.vpc.arn
  tags = {
    Name = "NYPETS-vpc-rt-pub"
  }
}

resource "aws_route" "rt_pub_default_i_pv4" {
  route_table_id = aws_route_table.rt_pub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_route" "rt_pub_default_i_pv6" {
  route_table_id = aws_route_table.rt_pub.id
  destination_ipv6_cidr_block = "::/0"
  gateway_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "rt_association_pub_a" {
  subnet_id = aws_subnet.snpuba.id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_route_table_association" "rt_association_pub_b" {
  subnet_id = aws_subnet.snpubb.id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_route_table_association" "rt_association_pub_c" {
  subnet_id = aws_subnet.snpubc.id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_subnet" "sndba" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(data.aws_availability_zones.available.names, 0)
  cidr_block = "10.16.16.0/20"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"01::/64"}"
  tags = {
    Name = "sn-db-A"
  }
}

resource "aws_subnet" "sndbb" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 1)
  cidr_block = "10.16.80.0/20"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"05::/64"}"
  tags = {
    Name = "sn-db-B"
  }
}

resource "aws_subnet" "sndbc" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 2)
  cidr_block = "10.16.144.0/20"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"09::/64"}"
  tags = {
    Name = "sn-db-C"
  }
}

resource "aws_subnet" "snappa" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 0)
  cidr_block = "10.16.32.0/20"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"02::/64"}"
  tags = {
    Name = "sn-app-A"
  }
}

resource "aws_subnet" "snappb" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 1)
  cidr_block = "10.16.96.0/20"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"06::/64"}"
  tags = {
    Name = "sn-app-B"
  }
}

resource "aws_subnet" "snappc" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 2)
  cidr_block = "10.16.160.0/20"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"0A::/64"}"
  tags = {
    Name = "sn-app-C"
  }
}

resource "aws_subnet" "snpuba" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 0)
  cidr_block = "10.16.48.0/20"
  map_public_ip_on_launch = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"03::/64"}"
  tags = {
    Name = "sn-pub-A"
  }
}

resource "aws_subnet" "snpubb" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 1)
  cidr_block = "10.16.112.0/20"
  map_public_ip_on_launch = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"07::/64"}"
  tags = {
    Name = "sn-pub-B"
  }
}

resource "aws_subnet" "snpubc" {
  vpc_id = aws_vpc.vpc.arn
  availability_zone = element(// Unable to resolve Fn::GetAZs with value: "" because cannot access local variable 'az_data' where it is not associated with a value, 2)
  cidr_block = "10.16.176.0/20"
  map_public_ip_on_launch = true
  ipv6_cidr_block = "${element(split(""00::/56"", element(aws_vpc.vpc.id, 0)), 0)}${"0B::/64"}"
  tags = {
    Name = "sn-pub-C"
  }
}

resource "aws_default_subnet" "i_pv6_workaround_subnet_puba" {
  // CF Property(ServiceToken) = aws_lambda_function.i_pv6_workaround_lambda.arn
  availability_zone_id = aws_subnet.snpuba.id
}

resource "aws_default_subnet" "i_pv6_workaround_subnet_pubb" {
  // CF Property(ServiceToken) = aws_lambda_function.i_pv6_workaround_lambda.arn
  availability_zone_id = aws_subnet.snpubb.id
}

resource "aws_default_subnet" "i_pv6_workaround_subnet_pubc" {
  // CF Property(ServiceToken) = aws_lambda_function.i_pv6_workaround_lambda.arn
  availability_zone_id = aws_subnet.snpubc.id
}

resource "aws_iam_role" "i_pv6_workaround_role" {
  assume_role_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com"
          ]
        }
        Action = [
          "sts:AssumeRole"
        ]
      }
    ]
  }
  path = "/"
  force_detach_policies = [
    {
      PolicyName = "ipv6-fix-logs-${local.stack_name}"
      PolicyDocument = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            Resource = "arn:aws:logs:*:*:*"
          }
        ]
      }
    },
    {
      PolicyName = "ipv6-fix-modify-${local.stack_name}"
      PolicyDocument = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "ec2:ModifySubnetAttribute"
            ]
            Resource = "*"
          }
        ]
      }
    }
  ]
}

resource "aws_lambda_function" "i_pv6_workaround_lambda" {
  handler = "index.lambda_handler"
  code_signing_config_arn = {
    ZipFile = "import cfnresponse
import boto3

def lambda_handler(event, context):
    if event['RequestType'] is 'Delete':
      cfnresponse.send(event, context, cfnresponse.SUCCESS)
      return

    responseValue = event['ResourceProperties']['SubnetId']
    ec2 = boto3.client('ec2', region_name='${data.aws_region.current.name}')
    ec2.modify_subnet_attribute(AssignIpv6AddressOnCreation={
                                    'Value': True
                                  },
                                  SubnetId=responseValue)
    responseData = {}
    responseData['SubnetId'] = responseValue
    cfnresponse.send(event, context, cfnresponse.SUCCESS, responseData, "CustomResourcePhysicalID")
"
  }
  runtime = "python3.9"
  role = aws_iam_role.i_pv6_workaround_role.arn
  timeout = 30
}

resource "aws_security_group" "sg_wordpress" {
  vpc_id = aws_vpc.vpc.arn
  description = "Control access to Wordpress Instance(s)"
  ingress = [
    {
      description = "Allow HTTP IPv4 IN"
      protocol = "tcp"
      from_port = "80"
      to_port = "80"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

resource "aws_security_group" "sg_database" {
  vpc_id = aws_vpc.vpc.arn
  description = "Control access to Database"
  ingress = [
    {
      description = "Allow MySQL IN"
      protocol = "tcp"
      from_port = "3306"
      to_port = "3306"
      security_groups = aws_security_group.sg_wordpress.arn
    }
  ]
}

resource "aws_security_group" "sg_load_balancer" {
  vpc_id = aws_vpc.vpc.arn
  description = "Control access to Load Balancer"
  ingress = [
    {
      description = "Allow HTTP IPv4 IN"
      protocol = "tcp"
      from_port = "80"
      to_port = "80"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

resource "aws_security_group" "sgefs" {
  vpc_id = aws_vpc.vpc.arn
  description = "Control access to EFS"
  ingress = [
    {
      description = "Allow NFS/EFS IPv4 IN"
      protocol = "tcp"
      from_port = "2049"
      to_port = "2049"
      security_groups = aws_security_group.sg_wordpress.arn
    }
  ]
}

resource "aws_iam_role" "wordpress_role" {
  assume_role_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "ec2.amazonaws.com"
          ]
        }
        Action = [
          "sts:AssumeRole"
        ]
      }
    ]
  }
  path = "/"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientFullAccess"
  ]
}

resource "aws_iam_instance_profile" "wordpress_instance_profile" {
  path = "/"
  role = [
    aws_iam_role.wordpress_role.arn
  ]
}
