# Specify the AWS provider
provider "aws" {
  region = "eu-west-1" # Ireland region
}

# Data source to fetch the latest Amazon Linux 2 EBS-backed AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Amazon Linux 2 AMIs
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"] # Ensure it is EBS-backed
  }

  owners = ["137112412989"] # Amazon's official account ID
}

# Create a security group to allow SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access to EC2 instances"
# Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to all (adjust as needed for security)
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my_ec2_instance" {
  ami           = data.aws_ami.amazon_linux_2.id # Fetch the latest Amazon Linux 2 AMI
  instance_type = "t2.micro"                     # Free tier eligible
  key_name      = "jaseel"                       # Key pair name (ensure the key exists in your AWS account)

  # Attach the security group to the instance
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "MyEC2Instance"
  }
