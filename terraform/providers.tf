        // Specifies that we are using the HashiCorp AWS provider.
        terraform {
          required_providers {
            aws = {
              source  = "hashicorp/aws"
              version = "~> 4.0"
            }
          }
        }

        // Configures the AWS provider with the desired region.
        // It will automatically use the credentials configured via the AWS CLI.
        provider "aws" {
          region = var.aws_region
        }
        