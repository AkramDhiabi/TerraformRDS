module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.micro"
  allocated_storage = 10

  name     = "demodb"
  username = "akd"
  password = "akddhib1985"
  port     = "3306"

  #iam_database_authentication_enabled = true

  #vpc_security_group_ids = ["sg-12345678"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
   
  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}