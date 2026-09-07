variable "role_name" {
  type        = string
  description = "Name of the IAM role"
  default     = "security-iam-role"
}

variable "assume_role_policy_json" {
  type        = string
  description = "JSON policy document that grants an entity permission to assume the role"
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "List of managed IAM policy ARNs to attach to the role"
  default     = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to IAM resources"
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
