locals {
  cluster_name = "eks-cluster-${random_string.random.result}"
  vpc_name     = "eks-vpc-${random_string.random.result}"

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
    aws-ebs-csi-driver = {
      service_account_role_arn = aws_iam_role.ebs_csi_controller.arn
    }
  }
}