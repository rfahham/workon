
sudo su
cat /etc/ansible/hosts
echo "" > /etc/ansible/hosts
echo "[instances]" > /etc/ansible/hosts
echo "ec2-user@ec2-3-80-127-116.compute-1.amazonaws.com" >> /etc/ansible/hosts
echo "ec2-user@ec2-67-202-37-43.compute-1.amazonaws.com" >> /etc/ansible/hosts
cat /etc/ansible/hosts
