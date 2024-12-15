# Installing Axelor Using Docker

This guide provides a step-by-step solution for installing Axelor using Docker. After extensive research, I found that the available documentation is limited, and errors are common. Therefore, I’m sharing this solution in case someone finds it helpful.

## Prerequisites

Ensure you have the following installed on your system:

- Docker
- Docker Compose

## Steps to Install

1. Clone this repository:
   ```bash
   git clone https://github.com/RAJI-Zakaria/axelor-open-suite
   ```
2. Navigate to the project directory:
   ```bash
   cd axelor-open-suite
   ```
3. Build and start the containers:
   ```bash
   ./startup.sh
   ```
4. Access the application in your browser at `http://localhost:7070` --> `user : admin | pass : admin`.

Note : `Please note that when you run the app for the first time, it will take ±10 minutes to create database and prepare files...`

## Stopping and Cleaning Up

1. To stop and remove the Axelor containers, run:

   ```bash
   ./shutdown.sh
   ```

2. To delete all data and start fresh, run:
   ```bash
   ./removeAll.sh
   ```

## Configuration Details

- PostgreSQL is configured with the following credentials:

  - **Username**: `axelor`
  - **Password**: `axelor`
  - **Database**: `axelor`

- Axelor application is exposed on port `7070`.

## Common Issues and Solutions

- **Database Connection Error**: Ensure the database container is running, and the credentials in `axelor-config.properties` match those in `docker-compose.yml`.

- **Port Conflict**: If port `7070` is already in use, update the port mapping in the `docker-compose.yml` file.

## Notes

This project includes three scripts for easier management:

1. `startup.sh` - Builds and starts the Axelor application.
2. `shutdown.sh` - Stops and removes the Axelor containers without affecting data.
3. `removeAll.sh` - Deletes all containers, volumes, and networks related to Axelor, allowing for a fresh start.

Feel free to adapt the scripts to your requirements. For any issues, please raise an issue in the repository.
