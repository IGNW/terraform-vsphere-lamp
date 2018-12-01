#!/bin/bash

function timestamp {
  echo $(date "+%F %T")
}

function info {
  echo "$(timestamp) INFO:  $1" | tee -a /tmp/terraform.log
}

function error {
  echo "$(timestamp) ERROR: $1" | tee -a /tmp/terraform.log
}

info "VM created by Terraform"
