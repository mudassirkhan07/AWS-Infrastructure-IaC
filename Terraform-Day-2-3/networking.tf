resource "aws_vpc" "ecell-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ecell-vpc"
  }
}

resource "aws_subnet" "my_subnet_1" {
  vpc_id            = aws_vpc.ecell-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_1"
  }
}

# creating the second subnet
resource "aws_subnet" "my_subnet_2" {
  vpc_id            = aws_vpc.ecell-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet_2"
  }
}

resource "aws_internet_gateway" "igt_1" {
  vpc_id = aws_vpc.ecell-vpc.id
  tags = {
    Name = "ecell-igw"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ecell-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igt_1.id
  }

  tags = {
    Name = "my_route_table"
  }
}

resource "aws_route_table_association" "subnet_1" {
  subnet_id      = aws_subnet.my_subnet_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "subnet_2" {
  subnet_id      = aws_subnet.my_subnet_2.id
  route_table_id = aws_route_table.public.id
}
