#!/bin/bash

if [ "$1" != "" ] && [ "$2" != "" ] && [ "$3" != "" ]; then

	cat $3 | kubectl exec --namespace=$1 -i $2 -- psql -U blerter -d blerter

else
    echo "Error: syntax <namespace> <pod> <sql file>"
fi
