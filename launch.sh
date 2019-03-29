#!/bin/bash
function run_terraform(){
    packer build packer.json
    terraform init
    terraform plan
    terraform apply
}
run_terraform