# ☁️ AWS Infrastructure Provisioning with Terraform Cloud

Provisioning AWS infrastructure using Terraform Cloud and GitHub — demonstrating Infrastructure as Code, GitOps workflows, and secure credential management.

---

## What This Project Does

| Feature | Detail |
|---------|--------|
| Infrastructure | EC2 instance + S3 bucket provisioned via Terraform |
| State Management | Remote state stored and managed in Terraform Cloud |
| Deployment Trigger | Auto-deploys on every git push to main |
| Credentials | Secured via Terraform Cloud workspace variables |
| Workflow | GitOps — GitHub is single source of truth |

---

## Architecture
GitHub Repo (main)
│
│  git push
▼
Terraform Cloud
│
├──  Plan  →  preview changes
│
└──  Apply →  provision AWS resources
│
┌──────────┴──────────┐
│                     │
EC2 Instance            S3 Bucket
(HelloWorld)          (demo storage)
---

## Tech Stack

`Terraform` `Terraform Cloud` `AWS EC2` `AWS S3` `GitHub` `IAM`

---

## Key Highlights

- **Infrastructure as Code** — all AWS resources defined in `.tf` files, version controlled in GitHub
- **Remote State** — Terraform Cloud manages state file, enabling team collaboration and consistent deployments
- **GitOps Workflow** — pushing code to GitHub automatically triggers a Terraform plan and apply in Terraform Cloud
- **Secure Secrets** — AWS credentials stored as Terraform Cloud workspace variables, never hardcoded

---

## Project Structure
aws-iac-terraform-cloud/
├── main.tf          # EC2 instance + S3 bucket resources
├── variables.tf     # Input variables
├── outputs.tf       # EC2 public IP, S3 bucket name
└── providers.tf     # AWS provider and Terraform Cloud backend config
---

## Resources Provisioned

### EC2 Instance
```hcl
resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  tags = {
    Name = "HelloWorld"
  }
}
```

### S3 Bucket
```hcl
resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name
  tags = {
    Name = "demo-bucket"
  }
}
```

---

## How to Use

### 1. Clone the repo
```bash
git clone https://github.com/JNisrat/aws-iac-terraform-cloud.git
cd aws-iac-terraform-cloud
```

### 2. Connect to Terraform Cloud
Update `main.tf` backend block with your Terraform Cloud org and workspace:
```hcl
terraform {
  cloud {
    organization = "your-org-name"
    workspaces {
      name = "aws-iac-terraform-cloud"
    }
  }
}
```

### 3. Set workspace variables in Terraform Cloud
---

## Resources Provisioned

### EC2 Instance
```hcl
resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  tags = {
    Name = "HelloWorld"
  }
}
```

### S3 Bucket
```hcl
resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name
  tags = {
    Name = "demo-bucket"
  }
}
```

---

## How to Use

### 1. Clone the repo
```bash
git clone https://github.com/JNisrat/aws-iac-terraform-cloud.git
cd aws-iac-terraform-cloud
```

### 2. Connect to Terraform Cloud
Update `main.tf` backend block with your Terraform Cloud org and workspace:
```hcl
terraform {
  cloud {
    organization = "your-org-name"
    workspaces {
      name = "aws-iac-terraform-cloud"
    }
  }
}
```

### 3. Set workspace variables in Terraform Cloud
AWS_ACCESS_KEY_ID      →  your AWS access key
AWS_SECRET_ACCESS_KEY  →  your AWS secret key

### 4. Push to trigger deployment
```bash
git add .
git commit -m "provision infrastructure"
git push
```

Terraform Cloud automatically runs plan then apply.

