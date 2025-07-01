        // This resource defines a security group (a virtual firewall) for our server.
        resource "aws_security_group" "app_server_sg" {
          name        = "app-server-sg"
          description = "Allow HTTP, HTTPS, and SSH traffic"
          vpc_id      = aws_vpc.main.id

          // --- Inbound Rules ---

          // Allow SSH traffic from your IP address ONLY.
          // IMPORTANT: Replace "0.0.0.0/0" with your actual IP address for security.
          // To find your IP, google "what is my ip".
          ingress {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["47.199.226.221/32"] // <-- CHANGE THIS to ["YOUR_IP/32"]
          }

          // Allow HTTP traffic from anywhere.
          ingress {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
          }

          // Allow HTTPS traffic from anywhere.
          ingress {
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
          }

          // --- Outbound Rule ---

          // Allow all outbound traffic.
          egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
          }

          tags = {
            Name = "url-shortener-sg"
          }
        }
        