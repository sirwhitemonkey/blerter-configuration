
#!/bin/bash


if [ "$1" != "" ] && [ "$2" != "" ]; then

 case "$2" in
        start)
        kubectl create -f config.yaml --namespace=$1 
        ;;
        stop)
        kubectl delete -f config.yaml --namespace=$1 --grace-period=0
        ;;
        *)
        echo "Usage: {start|stop}"
        ;;
    esac
else
    echo "Error: syntax <namespace> <build|start|stop>"
fi
