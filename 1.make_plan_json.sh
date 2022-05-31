#!/bin/bash

set -x

#if [ $# -ne 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

tf plan -out=tf.tfplan 
tf show -json tf.tfplan  > tfplan.json
