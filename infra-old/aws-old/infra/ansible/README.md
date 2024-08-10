# Configurando Ansible Ad Hock

## Verificando comunicação com localhost

```bash
ansible localhost -m ping

    localhost | SUCCESS => {
        "changed": false,
        "ping": "pong" }
```

## Adicionar arquivo hosts com os IPs das instâncias

Passar o caminho completo com o usuário que irá conectar a instância

`[instances]`

`ec2-user@ec2-<IP>.compute-1.amazonaws.com`
`ec2-user@ec2-<IP>.compute-1.amazonaws.com`

## Listar os Hosts

```bash
aws ec2 describe-instances --profile terraform | grep PublicDnsName

ou 

✗ ansible all -i hosts -m ping --list-hosts
  hosts (2):
    ec2-user@ec2-<IP>.compute-1.amazonaws.com
    ec2-user@ec2-<IP>.compute-1.amazonaws.com
```

## Verificando comunicação com os hosts

```bash
ansible all -i hosts -m ping
ansible all -i /etc/ansible/hosts -m ping

ec2-user@ec2-<IP>.compute-1.amazonaws.com | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
}
ec2-user@ec2-<IP>.compute-1.amazonaws.com | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
}
```

## Passando os ips

```bash
~ ansible all -i 'ec2-<IP>.compute-1.amazonaws.com, ec2-<IP>.compute-1.amazonaws.com,' -m ping --private-key=~/.ssh/id_rsa -u ec2-user
    ec2-<IP>.compute-1.amazonaws.com | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.9"
    },
    "changed": false,
    "ping": "pong"
    }

    ec2-<IP>.compute-1.amazonaws.com | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python3.9"
        },
        "changed": false,
        "ping": "pong"
    }
```

## Instalando NGINX nos hosts

```bash
ansible-playbook ./playbooks/nginx.yaml
```

