output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# Output the service account name
output "serviceaccount_name" {
  description = "Name of the AWS Load Balancer Controller Service Account"
  value       = kubernetes_service_account.aws_load_balancer_controller.metadata[0].name
}