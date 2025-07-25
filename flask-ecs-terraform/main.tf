provider "aws" {
  region = "ap-south-1"
}

resource "aws_ecs_cluster" "this" {
  name = "flask-ecs-cluster"
}

# (Add VPC, Subnets, Task Definitions, etc.)

output "cluster_name" {
  value = aws_ecs_cluster.this.name
}
