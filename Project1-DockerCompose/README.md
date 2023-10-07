# Project 1: Docker Compose Web Application

## Overview

This Docker Compose configuration simplifies the setup of a development environment for a web application stack. The stack includes a web server, a MySQL database, and PHPMyAdmin. Docker Compose streamlines the process of managing and orchestrating these services, making it easy to get started.

## Prerequisites

Before you begin, ensure that you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)


## Getting Started

To build and start the Docker containers, follow these steps:

1. Open a terminal or PowerShell in the project directory.

2. Run the following command to create and run the containers:

   ```bash
   docker-compose up -d



You can access the web application by opening a web browser and navigating to http://localhost.
If you want to access phpmyadmin, navigate to http://localhost:8001.

## Default Credentials

Use the following credentials for both PHPMyAdmin and the web application:

Username: admin
Password: admin

## Stopping the Containers

To stop and remove the containers, use the following command:

docker-compose down