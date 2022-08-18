#!/bin/bash

if [ $# -ne 2 ]
	then
		echo 'Needs to supply argument'
		echo '  $1 = <tfc org>'
		echo '  $2 = <tfc workspace name>'
		exit 1
fi

set -x

ORG=${1}
WS=${2}

TFC_TOKEN=$(cat ~/.terraform.d/credentials.tfrc.json  | jq -r '.credentials."app.terraform.io".token')
TFC_HOSTNAME=app.terraform.io

OUTPUT_HTML=drift.html

WS_ID=$(curl -s --header "Authorization: Bearer ${TFC_TOKEN}" --request GET https://${TFC_HOSTNAME}/api/v2/organizations/${1}/workspaces/${2} | jq -r '.data.id')

snyk iac describe --only-managed \
	--html-file-output="managed-${OUTPUT_HTML}" \
	--from="tfstate+tfcloud://${WS_ID}" \
	--tfc-token="${TFC_TOKEN}" \
	--tfc-endpoint="https://${TFC_HOSTNAME}/api/v2" 
 
snyk iac describe --all \
	--html-file-output="all-${OUTPUT_HTML}" \
	--from="tfstate+tfcloud://${WS_ID}" \
	--tfc-token="${TFC_TOKEN}" \
	--tfc-endpoint="https://${TFC_HOSTNAME}/api/v2" 
