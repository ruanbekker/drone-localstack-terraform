resource "random_password" "db_admin_password" {
    length = 16
    special = true
    override_special = "_"
}

resource "aws_ssm_parameter" "database_password" {
  name  = "/demo/dev/MYSQL_PASSWORD"
  type  = "String"
  value = random_password.db_admin_password.result
}
