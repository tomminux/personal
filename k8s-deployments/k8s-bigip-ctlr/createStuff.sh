#!/bin/bash
kubectl create secret generic bigip-login --namespace kube-system --from-literal=username=admin --from-literal=password=admin
kubectl create serviceaccount bigip-ctlr -n kube-system
