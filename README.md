# dap-deploy-k8s-demo
Scripts showing step by step deployment of DAP followers on EKS

* Create an Amazon Linux 2 jump host
* Provision an instance of the DAP AMI for the master
* Create ECR Registries for seed-fetcher and conjur-appliance
* Download the 000-prerequisites/setup.sh script to the jump host and run it
* Clone the repository onto the host
* Copy config.sh.template to config.sh and update the values
* Set into each directory in order and run the scripts
