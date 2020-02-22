# sshd

A Docker image for a barebones SSH server. 

Can be included into your Docker Compose setup for your Azure App Service for Linux Multi-Container Web App. 

To access your web app container's data volume(s) via SSH, share them with this container.

## Usage

sshd:
    image: rimads/sshd:1.0
    container_name: sshd
    restart: always
    ports:
      - "2222:2222"
    volumes:
      - <volume-name>:<web-app-data-dir>
    environment:
      SSH_PASSWD root:Docker!
