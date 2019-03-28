#!/usr/bin/env

function run_terraform(){
    sudo packer build packer.json
    terraform init
    terraform plan
    terraform apply
}
run_terraform