
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

data "helm_repository" "mosquitto" {
  name = "mosquitto"
  url = "https://storage.googleapis.com/t3n-helm-charts"
}

resource "helm_release" "mosquitto" {
  name             = "mosquitto"
  repository            = data.helm_repository.mosquitto.metadata[0].name
  # chart = "t3n/mosquitto"
  chart = "mosquitto"
  version = "2.4.1"
  namespace        = "mosquitto"
  create_namespace = true
  # values = [

  #   templatefile("./values.yml", {environment = var.environment, svcAcctName = ${local.svcAcctName} serviceName = ${local.serviceName}, storageClassName = kubernetes_storage_class_v1.ebs_cs_as_sc.metadata.[0].name, })
  # ]
}