#!/bin/bash

set -x

snyk iac test --scan=planned-values tfplan.json 
