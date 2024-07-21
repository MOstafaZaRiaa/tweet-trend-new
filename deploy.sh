#!/bin/sh
minikube start --force
minikube kubectl -- apply -f namespace.yml
minikube kubectl -- apply -f secret.yml
minikube kubectl -- apply -f deployment.yml
minikube kubectl -- apply -f service.yml
