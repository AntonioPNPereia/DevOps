# Project 3: Kubernets Web Application

## Overview

This Kubernetes configuration orchestrates 3 pods: one for MySQL, another for PHPMyAdmin, and a third for the web server. There's also a service dedicated to MySQL, which facilitates the connection between the webserver and PHPMyAdmin to the MySQL pod. The website mirrors the simplicity of Project 1, offering a basic login and database monitoring functionality.

## Prerequisites

Before you begin, ensure that you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)


## Getting Started

To build and start the Pods, follow these steps:

1. Open a terminal or PowerShell in the project directory.

2. Ensure Docker is running.

3. Run the following commands to create the Pod:

   ```bash
    # Start Minikube
    Minikube start

    # Configure your shell to use Minikube Docker daemon
    & minikube -p minikube docker-env --shell powershell | Invoke-Expression

    #Build the images needed
    docker-compose build

    # Create the Pods using the YAML file
    kubectl apply -f ./kubernetes/mysql-pod.yaml
    kubectl apply -f ./kubernetes/phpmyadmin-pod.yaml
    kubectl apply -f ./kubernetes/webserver-pod.yaml
    kubectl apply -f ./kubernetes/mysql-service.yaml

    # Forward the local port to the webserver pod
    kubectl port-forward webserver-pod 8080:80

    #If you want to also access phpmyadmin, open another terminal or PowerShell in the project directory and execute this command
    kubectl port-forward phpmyadmin-pod 8081:80

You can access the web application by opening a web browser and navigating to http://localhost:8080.
You can access the phpmyadmin by opening a web browser and navigating to http://localhost:8081.

## Default Credentials

Use the following credentials for both PHPMyAdmin and the web application:

Username: admin
Password: admin

## Stopping the Containers

To stop and remove the containers, use the following command:

minikube stop