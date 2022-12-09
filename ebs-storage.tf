# Resource: Kubernetes Storage Class
resource "kubernetes_storage_class_v1" "ebs_cs_as_sc" {
  metadata {
    name = "ebs-mosquitto-sc"
    # namespace = kubernetes_namespace_v1.cs-as-ns.metadata.0.name
  }
  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer"
}