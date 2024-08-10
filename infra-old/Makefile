COLOR_RESET = \033[0m
COLOR_COMMAND = \033[36m
COLOR_YELLOW = \033[33m
COLOR_GREEN = \033[32m
COLOR_RED = \033[31m

TEMP_FILES_REMOVE= 10.* authn-performance-tests

PROJECT := WORKON

setup-%:
	cd infra/terraform && ${MAKE} terraform-plan TF_VAR_env=$*

layout:
	@echo "\n${COLOR_YELLOW}\n----------------------------------------------------${COLOR_RESET}"
	@echo "\n${COLOR_YELLOW}[${PROJECT}] ${MESSAGE} ${COLOR_RESET}"
	@echo "${COLOR_YELLOW}\n----------------------------------------------------${COLOR_RESET}"

## Versão do Terraform
list:
	@ls -la

## Configura o ambiente do TAAS.
prepare:
	@${MAKE} layout MESSAGE="Configura o ambiente para execução Local"
	@/infra/terraform/terraform plan main.tf
    
## Criando as instâncias
create:
	@${MAKE} layout MESSAGE="Cria as instâncias"
	@terraform apply /infra/terraform/

## Listar localhost
config-localhost:
	@/infra/ansible/ansible all localhost -m ping

## Listar todos os servidores
config-all:
	@ansible all -i aws/ansible/hosts -m ping

## Exibe os comandos disponíveis.
help:
	@echo "\n${COLOR_YELLOW}\n----------\n${PROJECT}\n----------\n${COLOR_RESET}"
	@awk '/^[a-zA-Z\-\_0-9\.%]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "${COLOR_COMMAND}$$ make %s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort
	@printf "\n\n"