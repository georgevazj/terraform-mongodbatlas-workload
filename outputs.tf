output "db_user" {
  value = module.dbuser.username
}

output "db_password" {
  value = module.dbuser.password
  sensitive = true
}