#!/usr/bin/env bash

. ../config.sh

eksctl create cluster \
  --name $EKS_CLUSTER_NAME \
  --version $EKS_CLUSTER_VERSION \
  --nodegroup-name $EKS_CLUSTER_NODE_GROUP_NAME \
  --node-type $EKS_CLUSTER_NODE_TYPE \
  --nodes $EKS_NODES \
  --nodes-min $EKS_NODES_MIN \
  --nodes-max $EKS_NODES_MAX \
  --node-ami $EKS_NODE_AMI
