# WORKON

## Subindo Infra

```bash
terraform apply aws/infra/terraform
```

## Adicionando hosts

```bash
sudo su
cat /etc/ansible/hosts
echo "" > /etc/ansible/hosts
echo "[instances]" >> /etc/ansible/hosts
echo "ec2-user@ec2-<IP>.compute-1.amazonaws.com" >> /etc/ansible/hosts
echo "ec2-user@ec2-<IP>.compute-1.amazonaws.com" >> /etc/ansible/hosts
cat /etc/ansible/hosts
```

## Validando Hosts

```bash
ansible all -i /etc/ansible/hosts -m ping
```

## Subindo aplicação

```bash
ansible-playbook ./playbooks/nginx/nginx.yaml
```
