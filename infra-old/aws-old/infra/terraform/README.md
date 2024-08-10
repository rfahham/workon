# Comandos

## Versão do Terraform
version:
	@terraform --version

## Corrige o formato do Terraform
format:
	@terraform fmt

## Verifica se o projeto está ok
validate:
	@terraform validate

## Inicializa o Terraform
init:
	@terraform init

## Verifica o plano do Terraform
plan:
	@terraform plan

## Aplica o Terraform
apply:
	@terraform apply -auto-approve

## Lista os buckets
list:
	@aws s3 ls

## Destroy o Terraform
destroy:
	@terraform destroy
