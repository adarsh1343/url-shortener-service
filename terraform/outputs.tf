        // Output the public IP address of the EC2 instance.
        output "instance_public_ip" {
          value       = aws_instance.app_server.public_ip
          description = "The public IP address of the application server."
        }

        // Output the public DNS of the EC2 instance.
        output "instance_public_dns" {
          value       = aws_instance.app_server.public_dns
          description = "The public DNS name of the application server."
        }
        