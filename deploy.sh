#!/bin/sh
minikube start --force
minikube kubectl apply -f deployment.yml
