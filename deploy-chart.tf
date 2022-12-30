
# resource "kubernetes_namespace_v1" "mosquitto" {
#   metadata {
#     annotations = {
#       name = "some-value"
#     }
#     labels = {
#       alabel = "label-value"
#     }

#     name = "mosquitto"
#   }

# }

resource "helm_release" "mosquitto" {
  name             = "mosquitto"
  repository            = "https://storage.googleapis.com/t3n-helm-charts"
  # chart = "t3n/mosquitto"
  chart = "mosquitto"
  version = "2.4.1"
  namespace        = "mosquitto"
  create_namespace = true
}