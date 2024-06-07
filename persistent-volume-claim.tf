resource "kubernetes_storage_class_v1" "ebs_mosquitto_sc" {
  metadata {
    name = "ebs-mosquitto-sc"
  }
  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer"
}


resource "kubernetes_persistent_volume_claim_v1" "mq_pv_claim" {
  metadata {
    name = "mq-pv-claim"
    # labels = {
    #   app = "mosquitto"
    # }
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    # storage_class_name = kubernetes_storage_class_v1.ebs_mosquitto_sc.metadata.0.name
    storage_class_name = "ebs-mosquitto-sc"
    resources {
      requests = {
        storage = "2Gi"
      }
    }
  }
}
