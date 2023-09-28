Project 1 - Docker Compose

This Docker Compose configuration allows you to easily set up a development environment for a web application stack consisting of a web server, a MySQL database, and PHPMyAdmin. Using Docker Compose simplifies the process of managing and orchestrating these services. Below are the details and instructions for using this configuration:

To build and start the Docker containers:
docker-compose up -d
This command will download the required images, create and start the containers in the background.

You can access the web application by opening a web browser and navigating to http://localhost.
If you want to access phpmyadmin, navigate to http://localhost:8001.

These credentials are for phpmyadmin and to access the website:

Username: admin
Password: admin