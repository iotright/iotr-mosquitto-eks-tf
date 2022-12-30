/** All variables defined in cloud, but still need the local definitions here in order to reference them elsewhere */

# Core VPC variables

variable "prod_vpc_id" {
  description = "Core Hub VPC Id"
  type        = string
}

variable "prod_core_vpc_cidr" {
  description = "Core Hub VPC CIDR range"
  type        = string
}

# subnets and route tables for public, private, rds, elasticache

variable "prod_db_subnets" {
  description = "Core Hub VPC RDS subnets"
  type        = list(string)
}

variable "prod_rds_route_table_id" {
  description = "Core Hub VPC RDS route table id"
  type        = string
}

variable "prod_cache_subnets" {
  description = "Core Hub VPC elasticache subnets"
  type        = list(string)
}

variable "prod_cache_route_table_id" {
  description = "Core Hub VPC Elasticache route table id"
  type        = string
}

variable "prod_public_subnets" {
  description = "Core Hub VPC public subnets"
  type        = list(string)
}

variable "prod_public_route_table_id" {
  description = "Core Hub VPC public subnets route table id"
  type        = string
}

variable "prod_private_subnets" {
  description = "Core Hub VPC private subnets"
  type        = list(string)
}

variable "prod_private_route_table_id" {
  description = "Core Hub VPC private subnets route table id"
  type        = string
}

# security groups

variable "prod_web_alb_sg" {
  description = "Core Hub VPC web app load balancer security group"
  type        = string
}

variable "prod_rds_sgs" {
  description = "Core Hub RDS security groups (2)"
  type        = list(string)
  default = ["nobodycares"]
}

# Endpoints and connection creds

variable "sentry_dsn" {
  description = "endpoint for sentry service"
  type        = string
  default = "nobodycares"
}

variable "mqtt_endpoint" {
  description = "mqtt broker endpoint, can be over ridden, points to production endpoint by default"
  type        = string
  default = "nobodycares"
}

variable "prod_rds_endpoint" {
  description = "RDS endpoint"
  type        = string
  default = "nobodycares"
}

variable "prod_rds_pg_port" {
  description = "RDS port for aurora instance"
  type        = string
  default = "nobodycares"
}

variable "prod_atlas_endpoint" {
  description = "Production Atlas MongoDB endpoint"
  type        = string
  default = "nobodycares"
}

variable "prod_redis_endpoint" {
  description = "Production elasticache redis endpoint"
  type        = string
  default = "nobodycares"
}

variable "prod_rds_user" {
  description = "Production RDS username" # should be over ridden in each workspace
  type        = string
  default = "nobodycares"
}

variable "prod_rds_pass" {
  description = "Production RDS password" # should be over ridden in each workspace
  type        = string
  default = "nobodycares"
}

variable "prod_rds_db" {
  description = "Production RDS database name" # should be over ridden in each workspace
  type        = string
  default = "nobodycares"
}

variable "prod_atlas_user" {
  description = "Production atlas connect username; over ride in workspace"
  type        = string
  default = "nobodycares"
}

variable "prod_atlas_pass" {
  description = "Production atlas connection password; over ride in workspace"
  type        = string
  default = "nobodycares"
}

variable "prod_atlas_db" {
  description = "Production atlas connection db name; over ride in workspace"
  type        = string
  default = "nobodycares"
}

variable "iotright_com_zoneid" {
  description = "the zone id for the route53 iotright.com zone"
  type        = string
  default = "nobodycares"
}

variable "ssl_certificate_arn" {
  description = "arn for acm certificate used for *.iotright.com"
  type        = string
  default = "nobodycares"
}




