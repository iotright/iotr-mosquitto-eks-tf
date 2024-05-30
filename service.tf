resource "kubernetes_service_v1" "mosquitto" {
  metadata {
    name = "mosquitto"
    labels = {
      app = "mosquitto"
    }
  }

  spec {
    port {
      port        = 1883
      target_port = 1883
      name        = "mqtt"
    }
    port {
      port        = 9001
      target_port = 9001
      name        = "wss"
    }
    selector = {
      app = "mosquitto"
    }
    type = "ClusterIP"
  }
}
