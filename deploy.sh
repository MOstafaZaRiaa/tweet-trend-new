#!/bin/sh
minikube start --force
kubectl apply -f deployment.yml
