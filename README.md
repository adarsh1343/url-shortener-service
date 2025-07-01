<div align="center">
<img src="https://www.google.com/search?q=https://raw.githubusercontent.com/gist/adarsh1343/8b3c3c1b697e16e45f9e8a0f9a21d283/raw/c340f1a07c08889a6176a9f8f4a13f6e917d5985/url-logo.svg" alt="URL Shortener Logo" width="150">
<h1 style="color:#22d3ee;">URL Shortener Service with Full DevOps Pipeline</h1>
<p>A comprehensive, full-stack project demonstrating a complete DevOps lifecycle, from local development to automated cloud deployment.</p>

<p>
<img src="https://www.google.com/search?q=https://img.shields.io/badge/Node.js-339933%3Fstyle%3Dfor-the-badge%26logo%3Dnodedotjs%26logoColor%3Dwhite" alt="NodeJS">
<img src="https://www.google.com/search?q=https://img.shields.io/badge/PostgreSQL-4169E1%3Fstyle%3Dfor-the-badge%26logo%3Dpostgresql%26logoColor%3Dwhite" alt="PostgreSQL">
<img src="https://www.google.com/search?q=https://img.shields.io/badge/Docker-2496ED%3Fstyle%3Dfor-the-badge%26logo%3Ddocker%26logoColor%3Dwhite" alt="Docker">
<img src="https://www.google.com/search?q=https://img.shields.io/badge/Terraform-7B42BC%3Fstyle%3Dfor-the-badge%26logo%3Dterraform%26logoColor%3Dwhite" alt="Terraform">
<img src="https://www.google.com/search?q=https://img.shields.io/badge/AWS-232F3E%3Fstyle%3Dfor-the-badge%26logo%3Damazonaws%26logoColor%3Dwhite" alt="AWS">
<img src="https://www.google.com/search?q=https://img.shields.io/badge/GitHub_Actions-2088FF%3Fstyle%3Dfor-the-badge%26logo%3Dgithubactions%26logoColor%3Dwhite" alt="GitHub Actions">
</p>
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
<img src="https://www.google.com/search?q=https://raw.githubusercontent.com/gist/adarsh1343/8b3c3c1b697e16e45f9e8a0f9a21d283/raw/c340f1a07c08889a6176a9f8f4a13f6e917d5985/url-shortener-screenshot.png" alt="Application Screenshot" width="700">
</div>

🛠️ Tech Stack & Tools
This project utilizes a range of technologies to cover the entire development and deployment lifecycle.

Category

Technology

Backend

<img src="https://www.google.com/search?q=https://img.shields.io/badge/Node.js-339933%3Fstyle%3Dflat%26logo%3Dnodedotjs%26logoColor%3Dwhite" alt="NodeJS"> <img src="https://www.google.com/search?q=https://img.shields.io/badge/Express.js-000000%3Fstyle%3Dflat%26logo%3Dexpress%26logoColor%3Dwhite" alt="ExpressJS">

Database

<img src="https://www.google.com/search?q=https://img.shields.io/badge/PostgreSQL-4169E1%3Fstyle%3Dflat%26logo%3Dpostgresql%26logoColor%3Dwhite" alt="PostgreSQL">

Frontend

<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white" alt="HTML5"> <img src="https://www.google.com/search?q=https://img.shields.io/badge/Tailwind_CSS-38B2AC%3Fstyle%3Dflat%26logo%3Dtailwind-css%26logoColor%3Dwhite" alt="TailwindCSS">

DevOps

<img src="https://www.google.com/search?q=https://img.shields.io/badge/Docker-2496ED%3Fstyle%3Dflat%26logo%3Ddocker%26logoColor%3Dwhite" alt="Docker"> <img src="https://www.google.com/search?q=https://img.shields.io/badge/GitHub_Actions-2088FF%3Fstyle%3Dflat%26logo%3Dgithubactions%26logoColor%3Dwhite" alt="GitHub Actions">

Cloud & IaC

<img src="https://www.google.com/search?q=https://img.shields.io/badge/AWS-232F3E%3Fstyle%3Dflat%26logo%3Damazonaws%26logoColor%3Dwhite" alt="AWS"> (EC2, VPC, Security Groups) <br> <img src="https://www.google.com/search?q=https://img.shields.io/badge/Terraform-7B42BC%3Fstyle%3Dflat%26logo%3Dterraform%26logoColor%3Dwhite" alt="Terraform">

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

DOCKERHUB_TOKEN: A Docker Hub access token with write permissions.

<div align="center">
<p>Thank you for checking out this project!</p>
</div>
