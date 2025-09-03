# resource "kubernetes_storage_class_v1" "ebs_mosquitto_sc" {
#   metadata {
#     name = "ebs-mosquitto-sc"
#   }
#   storage_provisioner = "ebs.csi.aws.com"
#   volume_binding_mode = "WaitForFirstConsumer"
# }

# resource "kubernetes_persistent_volume_v1" "mq_pv" {
#   metadata {
#     name = "mq-pv"
#     labels = {
#       app = "mosquitto"
#     }
#   }

#   spec {
#     capacity = {
#       storage = "2Gi"
#     }

#     access_modes = ["ReadWriteOnce"]

#     persistent_volume_reclaim_policy = "Retain"

#     storage_class_name = "ebs-sc"

#     persistent_volume_source {
#       host_path {
#         path = "/mnt/data"
#       }
#     }
#   }
# }
