
variable "cidr_range" {
  type        = string
  description = "CIDR range for the instance"
  default     = "172.32.0.0/16"
}

variable "private_subnets" {
  type        = list(any)
  description = "List of private subnets"
  default     = ["172.32.48.0/20", "172.32.64.0/20", "172.32.80.0/20"]
}

variable "public_subnets" {
  type        = list(any)
  description = "List of public subnets"
  default     = ["172.32.0.0/20", "172.32.16.0/20", "172.32.32.0/20"]
}

variable "cluster_version" {
  type        = string
  description = "EKS cluster version"
  default     = "1.33"
}

variable "eks_default_instance_types" {
  type        = list(any)
  description = "EKS default instance types"
  default     = ["t3.medium"]
}

variable "eks_instance_types" {
  type        = list(any)
  description = "EKS instance types"
  default     = ["t3.medium"]
}

variable "eks_node_min_size" {
  type        = number
  description = "EKS node min size"
  default     = 2
}

variable "eks_node_max_size" {
  type        = number
  description = "EKS node max size"
  default     = 3
}

variable "eks_node_desired_size" {
  type        = number
  description = "EKS node desired size"
  default     = 2
}
