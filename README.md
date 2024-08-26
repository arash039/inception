# Inception
## Project Overview
Inception is a system administration project that focuses on using Docker to set up a small infrastructure composed of different services. The project involves creating and configuring multiple Docker containers to host a WordPress website with a MySQL database, all served through an Nginx web server with SSL/TLS encryption.
## Key Features
- Containerized Services: Separate containers for Nginx, WordPress (with php-fpm), and MariaDB
- Secure Communication: NGINX configured with TLSv1.2 or TLSv1.3
- Data Persistence: Volumes for WordPress database and website files
- Network Isolation: Custom Docker network for inter-container communication
- Automatic Restart: Containers configured to restart on crash
- Environment Variables: Sensitive information stored in .env file

## Prerequisites
- Docker
- Docker Compose

## Directory Structure

```.
├── Makefile
└── srcs
    ├── docker-compose.yml
    ├── .env
    └── requirements
        ├── mariadb
        │   ├── Dockerfile
        │   └── conf
        ├── nginx
        │   ├── Dockerfile
        │   └── conf
        └── wordpress
            ├── Dockerfile
            └── conf
```

## Setup and Usage

- Clone the repository
- Navigate to the project root
- Create a .env file in the srcs directory with necessary environment variables
- Run make to build and start the containers

## Makefile Commands

- make: Build and start all services
- make down: Stop and remove all containers
- make clean: Remove all containers, networks, and volumes

## Bonus Features
The project includes optional bonus features:

- Redis cache for WordPress
- FTP server
- Static website (non-PHP)
- Adminer

## Notes
- All configuration files must be in the srcs folder
- Custom Dockerfiles are used to build images
- No pre-built Docker images are used (except for base Alpine or Debian)
- The WordPress database has two users, including an administrator
