resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-rds-subnet-group"
  subnet_ids = var.subnets
  tags = {
    Name = "${var.environment}-rds-subnet-group"
    ENV  = var.environment
  }
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = "${var.environment}-aurora-cluster"
  engine                  = "aurora-mysql"
  master_username         = "admin"
  master_password         = "password123"
  db_subnet_group_name    = aws_db_subnet_group.main.name
  skip_final_snapshot     = true
  tags = {
    Name = "${var.environment}-aurora-cluster"
    ENV  = var.environment
  }
}
