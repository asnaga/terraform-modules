resource "aws_lb" "app" {
  name               = "${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets
  tags = {
    Name = "${var.environment}-alb"
    ENV  = var.environment
  }
}
