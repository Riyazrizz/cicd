provider "aws" {
  access_key = "YOUR_AWS_ACCESS_KEY_ID"  # Replace with your AWS Access Key
  secret_access_key = "YOUR_AWS_SECRET_ACCESS_KEY"  # Replace with your AWS Secret Access Key
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Update this with the correct AMI for your region
  instance_type = "t2.micro"  # Choose the instance type

  tags = {
    Name = "GitHub Actions EC2"
  }
}

# Uncomment below lines to see instance details in output
# output "instance_id" {
#   value = aws_instance.example.id
# }
#
# output "public_ip" {
#   value = aws_instance.example.public_ip
# }
