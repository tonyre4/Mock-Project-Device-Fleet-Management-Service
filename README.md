# Mock-Project-Device-Fleet-Management-Service

Test project for interview. Please refer to the [PDF](GD_Version__MockProject_%20DeviceFleetManagementService.pdf). for more details.


# Prerequisites

## Manual prerequisites

### Install docker (only first time)

Depends on your linux system but please refer to https://docs.docker.com/desktop/setup/install/linux/

Verify your installation by running:
```
docker run hello-world 
```
If you get this error:
```
ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied
```
1. Run the following:
```
sudo groupadd docker
sudo usermod -aG docker $USER
```
2. Log out then log-in, if error persist, reboot the system and try again.

# Build

## Create Proto files

## Build Server

# Run

## Run the Server

## Run the CLI