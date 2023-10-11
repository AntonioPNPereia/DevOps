# Project 2: Kubernets Hello World

## Overview

This Kubernetes configuration creates a Pod for a simple Hello World app using Python and Flask, with memory limited to 200MB. The sole purpose of this project is to demonstrate a basic API deployed on Kubernetes.

## Prerequisites

Before you begin, ensure that you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)


## Getting Started

To build and start the Docker containers, follow these steps:

1. Open a terminal or PowerShell in the project directory.

2. Ensure Docker is running.

3. Run the following commands to create the Pod:

   ```bash
    # Start Minikube
    Minikube start

    # Configure your shell to use Minikube Docker daemon
    & minikube -p minikube docker-env --shell powershell | Invoke-Expression

    #Build the Docker Image
    docker build -t flask-api .

    # Create the Pod using the YAML file
    kubectl create -f ./flask_api.yaml

    # Forward the local port to the Pod
    kubectl port-forward flask-api 5000:5000


You can access the web application by opening a web browser and navigating to http://localhost:5000.

## Stopping the Containers

To stop and remove the containers, use the following command:

minikube stop