output "ec2_arn" {
    value = aws_instance.example.arn
}

output "ssm_arn" {
    value = aws_ssm_parameter.database_password.arn
}
