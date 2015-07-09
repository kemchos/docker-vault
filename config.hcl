backend "file" {
	path = "/var/vault/"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 0
  tls_cert_file = "/etc/ssl/vault/cacert.pem"
  tls_key_file  = "/etc/ssl/vault/private/cakey.pem"
}