##### associate an IAM OIDC provider for the specified EKS cluster & enabling IRSA for fine-grained AWS permissions #####

# grant required ebs csi permission for stateful application
resource "aws_iam_role" "ebs_csi_controller" {
  name = "AmazonEKS_EBS_CSI_DriverRole"

  assume_role_policy = data.aws_iam_policy_document.ebs_assume_role_policy.json
}

# trust relationship policy for ebs csi driver
data "aws_iam_policy_document" "ebs_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [module.eks.oidc_provider_arn] # trust the IAM OIDC provider 
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
    }
  }
}

# attach with required policy to ebs csi driver
resource "aws_iam_role_policy_attachment" "ebs_csi_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi_controller.name
}