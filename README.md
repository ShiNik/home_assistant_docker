# Home Assistant Docker Setup and run

## Getting Started

This guide will walk you through setting up Home Assistant and its associated services using Docker Compose.

### Step-by-Step Instructions

1. **Clone the Repository**
```sh
git clone <repository-url>
```
2. **Change Directory**
```
cd home_assistant_docker
```
3. Run Setup
This step will create a virtual environment, install required Python packages, and set up necessary directories for Docker volumes
```
make setup
```
4. Start Docker Services
Use Docker Compose to start all services in the background.
```
make run
```
## Accessing Services
LocalAI Model List
To find the list of available models in terminal type:
```
curl http://localhost:8080/v1/models
```
To access Portainer, open your browser and go to:
```
http://localhost:9000/
```
To access Home Assistant, open your browser and go to:
```
http://localhost:8123/
```
If you encounter any issues, check the logs for each service using:
```
docker compose logs <service_name>
```

Services included in this setup:
- Home Assistant: http://localhost:8123
- Mosquitto: MQTT on mqtt://localhost:1883 and Webhooks on http://localhost:9001
- ESPHome: http://localhost:6052
- LocalAI: http://localhost:8080
- Portainer: https://localhost:9000/

To stop Docker Services
Use Docker Compose to stop all services in the background.
```
make stop
```