import os
import yaml

# Path to your Docker Compose file
compose_file_path = 'docker-compose.yaml'


def create_directories(volumes):
    for volume in volumes:
        host_path = volume.split(':')[0]
        if not os.path.exists(host_path):
            os.makedirs(host_path)
            print(f"Created directory: {host_path}")
        else:
            print(f"Directory already exists: {host_path}")


def main():
    with open(compose_file_path, 'r') as file:
        compose_content = yaml.safe_load(file)

    services = compose_content.get('services', {})

    for service_name, service_config in services.items():
        volumes = service_config.get('volumes', [])
        create_directories(volumes)


if __name__ == '__main__':
    main()
