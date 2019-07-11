#!/usr/bin/env bash

echo "==== Install jq, docker, git ===="
sudo yum update -y
sudo yum install -y jq docker git

echo "==== Install kubectl ===="
curl -o /tmp/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x /tmp/kubectl
sudo mv /tmp/kubectl /usr/local/bin/

echo "==== Install aws-iam-authenticator ===="
curl -o /tmp/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator
chmod +x /tmp/aws-iam-authenticator
sudo mv /tmp/aws-iam-authenticator /usr/local/bin/

echo "==== Install eksctl ===="
curl -s --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
chmod +x /tmp/eksctl
sudo mv /tmp/eksctl /usr/local/bin/

echo "==== Add ec2-user to docker group ===="
sudo usermod -a -G docker ec2-user

echo "==== Start and enable docker ===="
sudo systemctl start docker
sudo systemctl enable docker

echo "==== Configure AWS CLI ===="
aws configure

printf "\n===== Prerequisite Setup Complete - Please logout and login for changes to take affect =====\n"
