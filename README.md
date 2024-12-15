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
   sh ./startup.sh
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

# Guide: Connect pgAdmin to Axelor PostgreSQL Database

This guide explains step-by-step how to use **pgAdmin** to connect to the PostgreSQL database used by Axelor.

---

## Prerequisites

1. **pgAdmin** is installed and running.
2. PostgreSQL is running as a Docker container.
3. You have access to the pgAdmin credentials:

   - Email: `admin@admin.com`
   - Password: `admin`.

4. The database details:
   - **Hostname**: `postgres` (Docker service name).
   - **Port**: `5432`.
   - **Database Name**: `axelor`.
   - **Username**: `axelor`.
   - **Password**: `axelor`.

---

## Steps to Connect pgAdmin to the Database

1. **Log into pgAdmin**:

   - Open pgAdmin in your browser `http://localhost:5050`.
   - Use the credentials:
     - Email: `admin@admin.com`
     - Password: `admin`.

2. **Register the Server**:

   - Right-click on "Servers" and choose **Register → Server**.
   - Go to the **Connection** tab and fill in the following details:
     - **Host name/address**: `postgres`
     - **Port**: `5432`
     - **Maintenance database**: `postgres`
     - **Username**: `axelor`
     - **Password**: `axelor`
   - Click **Save**.

3. **Test the Connection**:
   - pgAdmin will attempt to connect to the database.
   - If successful, you will see the database tree under the registered server.

---

## Common Issues & Fixes

1. **Unable to Connect to Server**:

   - Verify the `docker-compose` file is running and PostgreSQL is active:
     ```bash
     docker-compose ps
     ```
     Look for the `axelor-postgres` service.

2. **Wrong Hostname**:

   - In a Docker network, use the service name `postgres` instead of `localhost`.

3. **Incorrect Credentials**:

   - Double-check the database username and password. Both should be `axelor`.

4. **Firewall Blocking Connections**:
   - Ensure port `5432` is open and accessible.
