# WORKON

## Subindo Infra

```bash
terraform apply aws/infra/terraform
```

## Adicionando hosts

```bash
cat /etc/ansible/hosts

sudo su
echo "" > /etc/ansible/hosts
echo "[instances]" >> /etc/ansible/hosts
echo "ec2-user@ec2-54-242-128-40.compute-1.amazonaws.com" >> /etc/ansible/hosts
echo "ec2-user@ec2-54-160-243-6.compute-1.amazonaws.com" >> /etc/ansible/hosts

ansible all -i /etc/ansible/hosts -m ping
```

## Subindo aplicação

```bash
ansible-playbook ./playbooks/nginx/nginx.yaml
```
