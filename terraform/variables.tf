        variable "aws_region" {
          description = "The AWS region to create resources in."
          type        = string
          default     = "us-east-1"
        }

        variable "instance_type" {
          description = "The EC2 instance type."
          type        = string
          default     = "t2.micro" # Eligible for AWS Free Tier
        }

        variable "key_name" {
            description = "Name of the SSH key pair to use for the EC2 instance."
            type        = string
            default     = "url-shortener-key"
        }
        