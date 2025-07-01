<div align="center">
<h1 style="color:#22d3ee;">URL Shortener Service with Full DevOps Pipeline</h1>
<p>A comprehensive, full-stack project demonstrating a complete DevOps lifecycle, from local development to automated cloud deployment.</p>
</div>

🚀 Project Overview
This project is a fully functional URL shortener web service. A user can input a long URL and receive a short, unique link that redirects to the original URL.

More than just a simple application, this repository serves as a practical demonstration of modern DevOps principles, including:

Containerization with Docker for consistent environments.

Infrastructure as Code (IaC) with Terraform for repeatable and version-controlled cloud setup.

Continuous Integration & Continuous Deployment (CI/CD) with GitHub Actions for automated testing, building, and deployment.

<br>

<div align="center">
<p><em>Application Frontend</em></p>
</div>

🛠️ Tech Stack & Tools
This project utilizes a range of technologies to cover the entire development and deployment lifecycle.

Category

Technology

Backend

Node.js, Express.js

Database

PostgreSQL

Frontend

HTML5, Tailwind CSS

DevOps

Docker, GitHub Actions

Cloud & IaC

AWS (EC2, VPC, Security Groups), Terraform

🏗️ Architecture & Workflow
The architecture is designed to be robust, scalable, and fully automated.

graph TD
    subgraph Local Development
        A[Developer writes code] --> B{Git Push to 'main'};
    end

    subgraph GitHub
        B --> C[GitHub Actions Triggered];
        C --> D{Build & Test};
        D --> E[Build Docker Image];
        E --> F[Push Image to Docker Hub];
    end

    subgraph Deployment
        F --> G{Deploy Job};
        G --> H[SSH into EC2 Server];
    end

    subgraph AWS Cloud
        H --> I[Pull new image from Docker Hub];
        I --> J[Stop old containers];
        J --> K[Run new containers: App & DB];
    end

    L[User] --> M{EC2 Public IP};
    M --> K;

    style A fill:#0f172a,stroke:#22d3ee,stroke-width:2px,color:#fff
    style B fill:#0f172a,stroke:#22d3ee,stroke-width:2px,color:#fff
    style C fill:#1e293b,stroke:#2088FF,stroke-width:2px,color:#fff
    style D fill:#1e293b,stroke:#2088FF,stroke-width:2px,color:#fff
    style E fill:#1e293b,stroke:#2088FF,stroke-width:2px,color:#fff
    style F fill:#1e293b,stroke:#2088FF,stroke-width:2px,color:#fff
    style G fill:#1e293b,stroke:#2088FF,stroke-width:2px,color:#fff
    style H fill:#1e293b,stroke:#2088FF,stroke-width:2px,color:#fff
    style I fill:#334155,stroke:#FF9900,stroke-width:2px,color:#fff
    style J fill:#334155,stroke:#FF9900,stroke-width:2px,color:#fff
    style K fill:#334155,stroke:#FF9900,stroke-width:2px,color:#fff
    style L fill:#0f172a,stroke:#22d3ee,stroke-width:2px,color:#fff
    style M fill:#334155,stroke:#FF9900,stroke-width:2px,color:#fff

⚙️ Local Development Setup
To run this project on your local machine, you'll need Docker and Node.js installed.

Clone the repository:

git clone [https://github.com/adarsh1343/url-shortener-service.git](https://github.com/adarsh1343/url-shortener-service.git)
cd url-shortener-service

Install Node.js dependencies:

npm install

Run with Docker Compose:
This single command will build the application image, pull the PostgreSQL image, and start both containers in a networked environment.

docker compose up --build

Access the application:
Open your browser and navigate to http://localhost:3000.

☁️ Cloud Infrastructure (Terraform)
The cloud infrastructure is defined entirely in code using Terraform. The scripts will provision the following AWS resources:

A Virtual Private Cloud (VPC) for network isolation.

A public subnet, internet gateway, and route tables.

An EC2 instance (t2.micro) to host the application.

A Security Group (firewall) to control traffic.

Prerequisites
Terraform CLI

AWS CLI configured with your credentials (aws configure).

Provisioning Steps
Navigate to the terraform directory:

cd terraform

Initialize Terraform:
Downloads the necessary provider plugins.

terraform init

Plan the deployment:
Shows you what resources will be created.

terraform plan

Apply the plan:
Builds the infrastructure on AWS.

terraform apply

🔄 CI/CD Pipeline (GitHub Actions)
The pipeline is defined in .github/workflows/deploy.yml and automates the entire deployment process.

How it Works
Trigger: A git push to the main branch triggers the workflow.

Build Job:

Logs into Docker Hub.

Builds a new Docker image of the Node.js application.

Tags the image with the unique Git commit SHA.

Pushes the new image to the Docker Hub repository.

Deploy Job:

Waits for the build job to succeed.

Securely connects to the AWS EC2 server via SSH.

Pulls the new Docker image from Docker Hub.

Stops and removes the old application and database containers.

Starts new containers using the updated image.

Required Secrets
The pipeline requires the following secrets to be configured in Settings > Secrets and variables > Actions:

EC2_SERVER_IP: Public IP of the EC2 instance.

EC2_USERNAME: ec2-user for Amazon Linux.

SSH_PRIVATE_KEY: The private SSH key to access the EC2 instance.

DOCKERHUB_USERNAME: Your Docker Hub username.

DOCKERHUB_TOKEN: A Docker Hub access token with
