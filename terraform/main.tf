// --- Networking ---

// Create a new Virtual Private Cloud (VPC) for our infrastructure.
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "url-shortener-vpc"
  }
}

// Create a public subnet. Resources in here can be assigned public IPs.
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true // Automatically assign a public IP to instances
  tags = {
    Name = "url-shortener-public-subnet"
  }
}

// Create an Internet Gateway to allow communication between the VPC and the internet.
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "url-shortener-igw"
  }
}

// Create a route table to route traffic from the subnet to the internet gateway.
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0" // Route all traffic
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "url-shortener-public-rt"
  }
}

// Associate the route table with our public subnet.
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

// --- Compute ---

// Upload our public SSH key to AWS.
resource "aws_key_pair" "deployer" {
    key_name   = var.key_name
    public_key = file("~/.ssh/url-shortener-key.pub")
}

// Create the EC2 server instance.
resource "aws_instance" "app_server" {
  // Find the latest Amazon Linux 2 AMI
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.app_server_sg.id]

  // This powerful script runs when the server is first created.
  // It installs and a-configures all our required software.
  user_data = <<-EOF
                #!/bin/bash
                # Update all packages
                yum update -y
                
                # Install Docker
                amazon-linux-extras install docker -y
                service docker start
                # Add ec2-user to the docker group so we can execute Docker commands without sudo
                usermod -a -G docker ec2-user
                
                # Install Docker Compose V2
                # This tells Terraform to treat it as a literal string for the shell script.
                DOCKER_CONFIG=$${DOCKER_CONFIG:-$HOME/.docker}
                mkdir -p $$DOCKER_CONFIG/cli-plugins
                curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o $$DOCKER_CONFIG/cli-plugins/docker-compose
                chmod +x $$DOCKER_CONFIG/cli-plugins/docker-compose

                # Install Git
                yum install git -y
                EOF

  tags = {
    Name = "URL-Shortener-Server"
  }
}

// A data source to dynamically find the latest Amazon Linux 2 AMI ID.
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
