resource "aws_ecs_cluster" "main" {
  name = "${var.environment}-ecs-cluster"
  tags = {
    Name = "${var.environment}-ecs-cluster"
    ENV  = var.environment
  }
}
