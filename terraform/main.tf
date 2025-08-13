# 配置 AWS Providers 使用 shorthand 别名
provider "aws" {
  alias  = "VA"
  region = "us-east-1"
}

provider "aws" {
  alias  = "OR"
  region = "us-west-2"
}

provider "aws" {
  alias  = "CPT"
  region = "af-south-1"
}

provider "aws" {
  alias  = "HK"
  region = "ap-east-1"
}

provider "aws" {
  alias  = "JKT"
  region = "ap-southeast-3"
}

provider "aws" {
  alias  = "OSA"
  region = "ap-northeast-3"
}

provider "aws" {
  alias  = "SGP"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "SYD"
  region = "ap-southeast-2"
}

provider "aws" {
  alias  = "FRA"
  region = "eu-central-1"
}

provider "aws" {
  alias  = "SAO"
  region = "sa-east-1"
}

# 为每个地区获取最新的 Ubuntu 22.04 AMI
data "aws_ami" "ubuntu_VA" {
  provider    = aws.VA
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_OR" {
  provider    = aws.OR
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_CPT" {
  provider    = aws.CPT
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_HK" {
  provider    = aws.HK
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_JKT" {
  provider    = aws.JKT
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_OSA" {
  provider    = aws.OSA
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_SGP" {
  provider    = aws.SGP
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_SYD" {
  provider    = aws.SYD
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_FRA" {
  provider    = aws.FRA
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu_SAO" {
  provider    = aws.SAO
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# 为每个地区创建 SSH 密钥对
resource "aws_key_pair" "fiber_test_key_VA" {
  provider   = aws.VA
  key_name   = "fiber-test-key-VA"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_OR" {
  provider   = aws.OR
  key_name   = "fiber-test-key-OR"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_CPT" {
  provider   = aws.CPT
  key_name   = "fiber-test-key-CPT"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_HK" {
  provider   = aws.HK
  key_name   = "fiber-test-key-HK"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_JKT" {
  provider   = aws.JKT
  key_name   = "fiber-test-key-JKT"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_OSA" {
  provider   = aws.OSA
  key_name   = "fiber-test-key-OSA"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_SGP" {
  provider   = aws.SGP
  key_name   = "fiber-test-key-SGP"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_SYD" {
  provider   = aws.SYD
  key_name   = "fiber-test-key-SYD"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_FRA" {
  provider   = aws.FRA
  key_name   = "fiber-test-key-FRA"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_key_pair" "fiber_test_key_SAO" {
  provider   = aws.SAO
  key_name   = "fiber-test-key-SAO"
  public_key = file("~/.ssh/id_ed25519.pub")
}

# 为每个地区创建 VPC
resource "aws_vpc" "main_VA" {
  provider             = aws.VA
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-VA"
  }
}

resource "aws_vpc" "main_OR" {
  provider             = aws.OR
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-OR"
  }
}

resource "aws_vpc" "main_CPT" {
  provider             = aws.CPT
  cidr_block           = "10.2.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-CPT"
  }
}

resource "aws_vpc" "main_HK" {
  provider             = aws.HK
  cidr_block           = "10.3.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-HK"
  }
}

resource "aws_vpc" "main_JKT" {
  provider             = aws.JKT
  cidr_block           = "10.4.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-JKT"
  }
}

resource "aws_vpc" "main_OSA" {
  provider             = aws.OSA
  cidr_block           = "10.5.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-OSA"
  }
}

resource "aws_vpc" "main_SGP" {
  provider             = aws.SGP
  cidr_block           = "10.6.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-SGP"
  }
}

resource "aws_vpc" "main_SYD" {
  provider             = aws.SYD
  cidr_block           = "10.7.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-SYD"
  }
}

resource "aws_vpc" "main_FRA" {
  provider             = aws.FRA
  cidr_block           = "10.8.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-FRA"
  }
}

resource "aws_vpc" "main_SAO" {
  provider             = aws.SAO
  cidr_block           = "10.9.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fiber-test-vpc-SAO"
  }
}

# 为每个地区创建子网
resource "aws_subnet" "public_VA" {
  provider                = aws.VA
  vpc_id                  = aws_vpc.main_VA.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "fiber-test-subnet-VA"
  }
}

resource "aws_subnet" "public_OR" {
  provider                = aws.OR
  vpc_id                  = aws_vpc.main_OR.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "fiber-test-subnet-OR"
  }
}

resource "aws_subnet" "public_CPT" {
  provider                = aws.CPT
  vpc_id                  = aws_vpc.main_CPT.id
  cidr_block              = "10.2.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "af-south-1a"

  tags = {
    Name = "fiber-test-subnet-CPT"
  }
}

resource "aws_subnet" "public_HK" {
  provider                = aws.HK
  vpc_id                  = aws_vpc.main_HK.id
  cidr_block              = "10.3.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-east-1a"

  tags = {
    Name = "fiber-test-subnet-HK"
  }
}

resource "aws_subnet" "public_JKT" {
  provider                = aws.JKT
  vpc_id                  = aws_vpc.main_JKT.id
  cidr_block              = "10.4.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-3a"

  tags = {
    Name = "fiber-test-subnet-JKT"
  }
}

resource "aws_subnet" "public_OSA" {
  provider                = aws.OSA
  vpc_id                  = aws_vpc.main_OSA.id
  cidr_block              = "10.5.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-3a"

  tags = {
    Name = "fiber-test-subnet-OSA"
  }
}

resource "aws_subnet" "public_SGP" {
  provider                = aws.SGP
  vpc_id                  = aws_vpc.main_SGP.id
  cidr_block              = "10.6.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"

  tags = {
    Name = "fiber-test-subnet-SGP"
  }
}

resource "aws_subnet" "public_SYD" {
  provider                = aws.SYD
  vpc_id                  = aws_vpc.main_SYD.id
  cidr_block              = "10.7.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-2a"

  tags = {
    Name = "fiber-test-subnet-SYD"
  }
}

resource "aws_subnet" "public_FRA" {
  provider                = aws.FRA
  vpc_id                  = aws_vpc.main_FRA.id
  cidr_block              = "10.8.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "fiber-test-subnet-FRA"
  }
}

resource "aws_subnet" "public_SAO" {
  provider                = aws.SAO
  vpc_id                  = aws_vpc.main_SAO.id
  cidr_block              = "10.9.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "sa-east-1a"

  tags = {
    Name = "fiber-test-subnet-SAO"
  }
}

# 为每个地区创建 Internet Gateway
resource "aws_internet_gateway" "gw_VA" {
  provider = aws.VA
  vpc_id   = aws_vpc.main_VA.id

  tags = {
    Name = "fiber-test-igw-VA"
  }
}

resource "aws_internet_gateway" "gw_OR" {
  provider = aws.OR
  vpc_id   = aws_vpc.main_OR.id

  tags = {
    Name = "fiber-test-igw-OR"
  }
}

resource "aws_internet_gateway" "gw_CPT" {
  provider = aws.CPT
  vpc_id   = aws_vpc.main_CPT.id

  tags = {
    Name = "fiber-test-igw-CPT"
  }
}

resource "aws_internet_gateway" "gw_HK" {
  provider = aws.HK
  vpc_id   = aws_vpc.main_HK.id

  tags = {
    Name = "fiber-test-igw-HK"
  }
}

resource "aws_internet_gateway" "gw_JKT" {
  provider = aws.JKT
  vpc_id   = aws_vpc.main_JKT.id

  tags = {
    Name = "fiber-test-igw-JKT"
  }
}

resource "aws_internet_gateway" "gw_OSA" {
  provider = aws.OSA
  vpc_id   = aws_vpc.main_OSA.id

  tags = {
    Name = "fiber-test-igw-OSA"
  }
}

resource "aws_internet_gateway" "gw_SGP" {
  provider = aws.SGP
  vpc_id   = aws_vpc.main_SGP.id

  tags = {
    Name = "fiber-test-igw-SGP"
  }
}

resource "aws_internet_gateway" "gw_SYD" {
  provider = aws.SYD
  vpc_id   = aws_vpc.main_SYD.id

  tags = {
    Name = "fiber-test-igw-SYD"
  }
}

resource "aws_internet_gateway" "gw_FRA" {
  provider = aws.FRA
  vpc_id   = aws_vpc.main_FRA.id

  tags = {
    Name = "fiber-test-igw-FRA"
  }
}

resource "aws_internet_gateway" "gw_SAO" {
  provider = aws.SAO
  vpc_id   = aws_vpc.main_SAO.id

  tags = {
    Name = "fiber-test-igw-SAO"
  }
}

# 为每个地区创建路由表
resource "aws_route_table" "public_VA" {
  provider = aws.VA
  vpc_id   = aws_vpc.main_VA.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_VA.id
  }

  tags = {
    Name = "fiber-test-route-table-VA"
  }
}

resource "aws_route_table" "public_OR" {
  provider = aws.OR
  vpc_id   = aws_vpc.main_OR.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_OR.id
  }

  tags = {
    Name = "fiber-test-route-table-OR"
  }
}

resource "aws_route_table" "public_CPT" {
  provider = aws.CPT
  vpc_id   = aws_vpc.main_CPT.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_CPT.id
  }

  tags = {
    Name = "fiber-test-route-table-CPT"
  }
}

resource "aws_route_table" "public_HK" {
  provider = aws.HK
  vpc_id   = aws_vpc.main_HK.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_HK.id
  }

  tags = {
    Name = "fiber-test-route-table-HK"
  }
}

resource "aws_route_table" "public_JKT" {
  provider = aws.JKT
  vpc_id   = aws_vpc.main_JKT.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_JKT.id
  }

  tags = {
    Name = "fiber-test-route-table-JKT"
  }
}

resource "aws_route_table" "public_OSA" {
  provider = aws.OSA
  vpc_id   = aws_vpc.main_OSA.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_OSA.id
  }

  tags = {
    Name = "fiber-test-route-table-OSA"
  }
}

resource "aws_route_table" "public_SGP" {
  provider = aws.SGP
  vpc_id   = aws_vpc.main_SGP.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_SGP.id
  }

  tags = {
    Name = "fiber-test-route-table-SGP"
  }
}

resource "aws_route_table" "public_SYD" {
  provider = aws.SYD
  vpc_id   = aws_vpc.main_SYD.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_SYD.id
  }

  tags = {
    Name = "fiber-test-route-table-SYD"
  }
}

resource "aws_route_table" "public_FRA" {
  provider = aws.FRA
  vpc_id   = aws_vpc.main_FRA.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_FRA.id
  }

  tags = {
    Name = "fiber-test-route-table-FRA"
  }
}

resource "aws_route_table" "public_SAO" {
  provider = aws.SAO
  vpc_id   = aws_vpc.main_SAO.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_SAO.id
  }

  tags = {
    Name = "fiber-test-route-table-SAO"
  }
}

# 将路由表关联到子网
resource "aws_route_table_association" "public_VA" {
  provider       = aws.VA
  subnet_id      = aws_subnet.public_VA.id
  route_table_id = aws_route_table.public_VA.id
}

resource "aws_route_table_association" "public_OR" {
  provider       = aws.OR
  subnet_id      = aws_subnet.public_OR.id
  route_table_id = aws_route_table.public_OR.id
}

resource "aws_route_table_association" "public_CPT" {
  provider       = aws.CPT
  subnet_id      = aws_subnet.public_CPT.id
  route_table_id = aws_route_table.public_CPT.id
}

resource "aws_route_table_association" "public_HK" {
  provider       = aws.HK
  subnet_id      = aws_subnet.public_HK.id
  route_table_id = aws_route_table.public_HK.id
}

resource "aws_route_table_association" "public_JKT" {
  provider       = aws.JKT
  subnet_id      = aws_subnet.public_JKT.id
  route_table_id = aws_route_table.public_JKT.id
}

resource "aws_route_table_association" "public_OSA" {
  provider       = aws.OSA
  subnet_id      = aws_subnet.public_OSA.id
  route_table_id = aws_route_table.public_OSA.id
}

resource "aws_route_table_association" "public_SGP" {
  provider       = aws.SGP
  subnet_id      = aws_subnet.public_SGP.id
  route_table_id = aws_route_table.public_SGP.id
}

resource "aws_route_table_association" "public_SYD" {
  provider       = aws.SYD
  subnet_id      = aws_subnet.public_SYD.id
  route_table_id = aws_route_table.public_SYD.id
}

resource "aws_route_table_association" "public_FRA" {
  provider       = aws.FRA
  subnet_id      = aws_subnet.public_FRA.id
  route_table_id = aws_route_table.public_FRA.id
}

resource "aws_route_table_association" "public_SAO" {
  provider       = aws.SAO
  subnet_id      = aws_subnet.public_SAO.id
  route_table_id = aws_route_table.public_SAO.id
}

# 为每个地区创建安全组
resource "aws_security_group" "fiber_test_sg_VA" {
  provider    = aws.VA
  name        = "fiber-test-security-group-VA"
  description = "Security group for fiber test instances in VA"
  vpc_id      = aws_vpc.main_VA.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-VA"
  }
}

resource "aws_security_group" "fiber_test_sg_OR" {
  provider    = aws.OR
  name        = "fiber-test-security-group-OR"
  description = "Security group for fiber test instances in OR"
  vpc_id      = aws_vpc.main_OR.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-OR"
  }
}

resource "aws_security_group" "fiber_test_sg_CPT" {
  provider    = aws.CPT
  name        = "fiber-test-security-group-CPT"
  description = "Security group for fiber test instances in CPT"
  vpc_id      = aws_vpc.main_CPT.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-CPT"
  }
}

resource "aws_security_group" "fiber_test_sg_HK" {
  provider    = aws.HK
  name        = "fiber-test-security-group-HK"
  description = "Security group for fiber test instances in HK"
  vpc_id      = aws_vpc.main_HK.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-HK"
  }
}

resource "aws_security_group" "fiber_test_sg_JKT" {
  provider    = aws.JKT
  name        = "fiber-test-security-group-JKT"
  description = "Security group for fiber test instances in JKT"
  vpc_id      = aws_vpc.main_JKT.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-JKT"
  }
}

resource "aws_security_group" "fiber_test_sg_OSA" {
  provider    = aws.OSA
  name        = "fiber-test-security-group-OSA"
  description = "Security group for fiber test instances in OSA"
  vpc_id      = aws_vpc.main_OSA.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-OSA"
  }
}

resource "aws_security_group" "fiber_test_sg_SGP" {
  provider    = aws.SGP
  name        = "fiber-test-security-group-SGP"
  description = "Security group for fiber test instances in SGP"
  vpc_id      = aws_vpc.main_SGP.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-SGP"
  }
}

resource "aws_security_group" "fiber_test_sg_SYD" {
  provider    = aws.SYD
  name        = "fiber-test-security-group-SYD"
  description = "Security group for fiber test instances in SYD"
  vpc_id      = aws_vpc.main_SYD.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-SYD"
  }
}

resource "aws_security_group" "fiber_test_sg_FRA" {
  provider    = aws.FRA
  name        = "fiber-test-security-group-FRA"
  description = "Security group for fiber test instances in FRA"
  vpc_id      = aws_vpc.main_FRA.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-FRA"
  }
}

resource "aws_security_group" "fiber_test_sg_SAO" {
  provider    = aws.SAO
  name        = "fiber-test-security-group-SAO"
  description = "Security group for fiber test instances in SAO"
  vpc_id      = aws_vpc.main_SAO.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP ports 8100-8300"
    from_port   = 8100
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fiber-test-sg-SAO"
  }
}

# 为每个地区创建 EC2 实例
resource "aws_instance" "fiber_test_nodes_VA" {
  provider          = aws.VA
  count             = 4
  ami               = data.aws_ami.ubuntu_VA.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_VA.id
  security_groups   = [aws_security_group.fiber_test_sg_VA.id]
  key_name          = aws_key_pair.fiber_test_key_VA.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-VA-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_OR" {
  provider          = aws.OR
  count             = 4
  ami               = data.aws_ami.ubuntu_OR.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_OR.id
  security_groups   = [aws_security_group.fiber_test_sg_OR.id]
  key_name          = aws_key_pair.fiber_test_key_OR.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-OR-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_CPT" {
  provider          = aws.CPT
  count             = 3
  ami               = data.aws_ami.ubuntu_CPT.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_CPT.id
  security_groups   = [aws_security_group.fiber_test_sg_CPT.id]
  key_name          = aws_key_pair.fiber_test_key_CPT.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-CPT-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_HK" {
  provider          = aws.HK
  count             = 3
  ami               = data.aws_ami.ubuntu_HK.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_HK.id
  security_groups   = [aws_security_group.fiber_test_sg_HK.id]
  key_name          = aws_key_pair.fiber_test_key_HK.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-HK-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_JKT" {
  provider          = aws.JKT
  count             = 3
  ami               = data.aws_ami.ubuntu_JKT.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_JKT.id
  security_groups   = [aws_security_group.fiber_test_sg_JKT.id]
  key_name          = aws_key_pair.fiber_test_key_JKT.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-JKT-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_OSA" {
  provider          = aws.OSA
  count             = 3
  ami               = data.aws_ami.ubuntu_OSA.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_OSA.id
  security_groups   = [aws_security_group.fiber_test_sg_OSA.id]
  key_name          = aws_key_pair.fiber_test_key_OSA.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-OSA-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_SGP" {
  provider          = aws.SGP
  count             = 3
  ami               = data.aws_ami.ubuntu_SGP.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_SGP.id
  security_groups   = [aws_security_group.fiber_test_sg_SGP.id]
  key_name          = aws_key_pair.fiber_test_key_SGP.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-SGP-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_SYD" {
  provider          = aws.SYD
  count             = 3
  ami               = data.aws_ami.ubuntu_SYD.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_SYD.id
  security_groups   = [aws_security_group.fiber_test_sg_SYD.id]
  key_name          = aws_key_pair.fiber_test_key_SYD.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-SYD-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_FRA" {
  provider          = aws.FRA
  count             = 3
  ami               = data.aws_ami.ubuntu_FRA.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_FRA.id
  security_groups   = [aws_security_group.fiber_test_sg_FRA.id]
  key_name          = aws_key_pair.fiber_test_key_FRA.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-FRA-node-${count.index + 1}"
  }
}

resource "aws_instance" "fiber_test_nodes_SAO" {
  provider          = aws.SAO
  count             = 3
  ami               = data.aws_ami.ubuntu_SAO.id
  instance_type     = "c5.xlarge"
  subnet_id         = aws_subnet.public_SAO.id
  security_groups   = [aws_security_group.fiber_test_sg_SAO.id]
  key_name          = aws_key_pair.fiber_test_key_SAO.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }

  tags = {
    Name = "fiber-test-SAO-node-${count.index + 1}"
  }
}

# 创建并绑定 Elastic IP
resource "aws_eip" "node_eip_VA" {
  provider = aws.VA
  count    = 4
  instance = aws_instance.fiber_test_nodes_VA[count.index].id

  tags = {
    Name = "fiber-test-eip-VA-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_OR" {
  provider = aws.OR
  count    = 4
  instance = aws_instance.fiber_test_nodes_OR[count.index].id

  tags = {
    Name = "fiber-test-eip-OR-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_CPT" {
  provider = aws.CPT
  count    = 3
  instance = aws_instance.fiber_test_nodes_CPT[count.index].id

  tags = {
    Name = "fiber-test-eip-CPT-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_HK" {
  provider = aws.HK
  count    = 3
  instance = aws_instance.fiber_test_nodes_HK[count.index].id

  tags = {
    Name = "fiber-test-eip-HK-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_JKT" {
  provider = aws.JKT
  count    = 3
  instance = aws_instance.fiber_test_nodes_JKT[count.index].id

  tags = {
    Name = "fiber-test-eip-JKT-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_OSA" {
  provider = aws.OSA
  count    = 3
  instance = aws_instance.fiber_test_nodes_OSA[count.index].id

  tags = {
    Name = "fiber-test-eip-OSA-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_SGP" {
  provider = aws.SGP
  count    = 3
  instance = aws_instance.fiber_test_nodes_SGP[count.index].id

  tags = {
    Name = "fiber-test-eip-SGP-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_SYD" {
  provider = aws.SYD
  count    = 3
  instance = aws_instance.fiber_test_nodes_SYD[count.index].id

  tags = {
    Name = "fiber-test-eip-SYD-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_FRA" {
  provider = aws.FRA
  count    = 3
  instance = aws_instance.fiber_test_nodes_FRA[count.index].id

  tags = {
    Name = "fiber-test-eip-FRA-${count.index + 1}"
  }
}

resource "aws_eip" "node_eip_SAO" {
  provider = aws.SAO
  count    = 3
  instance = aws_instance.fiber_test_nodes_SAO[count.index].id

  tags = {
    Name = "fiber-test-eip-SAO-${count.index + 1}"
  }
}

# 将集群信息输出到文件
resource "local_file" "cluster_info" {
  filename = "${path.module}/cluster_info.txt"
  content  = <<EOT
Region: VA
${join("\n", [for i in range(4) : "Instance ID: ${aws_instance.fiber_test_nodes_VA[i].id}\nPublic IP: ${aws_eip.node_eip_VA[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_VA[i].private_ip}\nHostname: fiber-test-VA-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: OR
${join("\n", [for i in range(4) : "Instance ID: ${aws_instance.fiber_test_nodes_OR[i].id}\nPublic IP: ${aws_eip.node_eip_OR[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_OR[i].private_ip}\nHostname: fiber-test-OR-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: CPT
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_CPT[i].id}\nPublic IP: ${aws_eip.node_eip_CPT[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_CPT[i].private_ip}\nHostname: fiber-test-CPT-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: HK
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_HK[i].id}\nPublic IP: ${aws_eip.node_eip_HK[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_HK[i].private_ip}\nHostname: fiber-test-HK-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: JKT
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_JKT[i].id}\nPublic IP: ${aws_eip.node_eip_JKT[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_JKT[i].private_ip}\nHostname: fiber-test-JKT-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: OSA
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_OSA[i].id}\nPublic IP: ${aws_eip.node_eip_OSA[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_OSA[i].private_ip}\nHostname: fiber-test-OSA-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: SGP
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_SGP[i].id}\nPublic IP: ${aws_eip.node_eip_SGP[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_SGP[i].private_ip}\nHostname: fiber-test-SGP-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: SYD
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_SYD[i].id}\nPublic IP: ${aws_eip.node_eip_SYD[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_SYD[i].private_ip}\nHostname: fiber-test-SYD-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: FRA
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_FRA[i].id}\nPublic IP: ${aws_eip.node_eip_FRA[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_FRA[i].private_ip}\nHostname: fiber-test-FRA-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
Region: SAO
${join("\n", [for i in range(3) : "Instance ID: ${aws_instance.fiber_test_nodes_SAO[i].id}\nPublic IP: ${aws_eip.node_eip_SAO[i].public_ip}\nPrivate IP: ${aws_instance.fiber_test_nodes_SAO[i].private_ip}\nHostname: fiber-test-SAO-node-${i + 1}\nGroup: ${i == 0 ? "Core" : i == 1 ? "Secondary" : "Edge"}\n---"])}
EOT
}

# 生成 Ansible inventory 文件
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"
  content  = <<EOT
[Core]
${aws_instance.fiber_test_nodes_VA[0].tags.Name} ansible_host=${aws_eip.node_eip_VA[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_OR[0].tags.Name} ansible_host=${aws_eip.node_eip_OR[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_CPT[0].tags.Name} ansible_host=${aws_eip.node_eip_CPT[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_HK[0].tags.Name} ansible_host=${aws_eip.node_eip_HK[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_JKT[0].tags.Name} ansible_host=${aws_eip.node_eip_JKT[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_OSA[0].tags.Name} ansible_host=${aws_eip.node_eip_OSA[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SGP[0].tags.Name} ansible_host=${aws_eip.node_eip_SGP[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SYD[0].tags.Name} ansible_host=${aws_eip.node_eip_SYD[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_FRA[0].tags.Name} ansible_host=${aws_eip.node_eip_FRA[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SAO[0].tags.Name} ansible_host=${aws_eip.node_eip_SAO[0].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519

[Secondary]
${aws_instance.fiber_test_nodes_VA[1].tags.Name} ansible_host=${aws_eip.node_eip_VA[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_OR[1].tags.Name} ansible_host=${aws_eip.node_eip_OR[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_CPT[1].tags.Name} ansible_host=${aws_eip.node_eip_CPT[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_HK[1].tags.Name} ansible_host=${aws_eip.node_eip_HK[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_JKT[1].tags.Name} ansible_host=${aws_eip.node_eip_JKT[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_OSA[1].tags.Name} ansible_host=${aws_eip.node_eip_OSA[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SGP[1].tags.Name} ansible_host=${aws_eip.node_eip_SGP[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SYD[1].tags.Name} ansible_host=${aws_eip.node_eip_SYD[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_FRA[1].tags.Name} ansible_host=${aws_eip.node_eip_FRA[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SAO[1].tags.Name} ansible_host=${aws_eip.node_eip_SAO[1].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519

[Edge]
${join("\n", [for i in range(2, 4) : "${aws_instance.fiber_test_nodes_VA[i].tags.Name} ansible_host=${aws_eip.node_eip_VA[i].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519"])}
${join("\n", [for i in range(2, 4) : "${aws_instance.fiber_test_nodes_OR[i].tags.Name} ansible_host=${aws_eip.node_eip_OR[i].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519"])}
${aws_instance.fiber_test_nodes_CPT[2].tags.Name} ansible_host=${aws_eip.node_eip_CPT[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_HK[2].tags.Name} ansible_host=${aws_eip.node_eip_HK[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_JKT[2].tags.Name} ansible_host=${aws_eip.node_eip_JKT[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_OSA[2].tags.Name} ansible_host=${aws_eip.node_eip_OSA[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SGP[2].tags.Name} ansible_host=${aws_eip.node_eip_SGP[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SYD[2].tags.Name} ansible_host=${aws_eip.node_eip_SYD[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_FRA[2].tags.Name} ansible_host=${aws_eip.node_eip_FRA[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
${aws_instance.fiber_test_nodes_SAO[2].tags.Name} ansible_host=${aws_eip.node_eip_SAO[2].public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519

[fiber_test:children]
Core
Secondary
Edge
EOT
}

# 创建清理脚本
resource "local_file" "cleanup_script" {
  filename = "${path.module}/cleanup.sh"
  content  = <<EOT
#!/bin/bash
echo "Destroying Terraform resources..."
terraform destroy -auto-approve
echo "Cleaning up Terraform files..."
rm -f terraform.tfstate*
rm -f inventory.ini
rm -f cluster_info.txt
rm -f cleanup.sh
echo "Cleanup completed!"
EOT
}
