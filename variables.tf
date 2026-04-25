variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.nano"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
  default     = "nisrat-demo-bucket-2026"  
}