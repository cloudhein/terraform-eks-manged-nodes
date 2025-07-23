##### IAM OIDC provider is automatically created when the EKS cluster is provisioned in eks module version 20.0 (enable_irsa=true) by default #####

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version

  # cluster addons plugins
  cluster_addons = local.cluster_addons

  # enable public access 
  cluster_endpoint_public_access = true

  # enable identity used by terraform as an administrator
  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.eks_default_instance_types
  }

  eks_managed_node_groups = {
    general = {
      instance_types = var.eks_instance_types # overrides default

      min_size     = var.eks_node_min_size
      max_size     = var.eks_node_max_size
      desired_size = var.eks_node_desired_size
    }
  }

  tags = {
    Name        = local.cluster_name
    Environment = "dev"
  }
}