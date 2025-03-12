resource "helm_release" "mosquitto" {
  name             = "mosquitto"
  chart            = "./mosquitto"
  namespace        = "default"
  create_namespace = true
  values = [
    file("mosquitto/values.yaml")
  ]
}
