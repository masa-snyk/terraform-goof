#!/bin/bash

set -x

terraform plan -out=tf.tfplan 
terraform show -json tf.tfplan  > tfplan.json
