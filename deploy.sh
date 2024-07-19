#!/bin/sh
minikube start
kubectl apply -f deployment.yml
