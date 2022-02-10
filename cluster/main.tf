locals {
  env = lower(var.env)
}
data "aws_vpc" "selected" {
  state = "available"
  tags = {
      Name = "DevOps-vpc"
  }
}
resource "aws_security_group" "default1" {
  name_prefix = "${local.env}-uptime"
  vpc_id = data.aws_vpc.selected.id
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_ecs_cluster" "default" {
#   name = "${local.env}-uptime-agents"
#   capacity_providers = [
#       "FARAGTE",
#       "FARGATE_SPOT"
#   ]
#   default_capacity_provider_startegy {
#       base = 0
#       capacity_provider = local.env == "dev" ? "FARGATE" : "FARGATE_SPOT"
#       weight = 100

#   }
#   setting {
#     name = "containerInsights"
#     value = var.container_insights
#   }
# }
resource "aws_security_group" "default" {
  name_prefix = "${local.env}-uptime"
  vpc_id = data.aws_vpc.selected.id
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
