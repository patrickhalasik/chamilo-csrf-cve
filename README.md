## How to build the 2 images

At the source of the project:

Build the 2 images:
docker build -t patrickhalasik/chamilo-malicious-csrf-page:1.11.10 -f csrf-poc/Dockerfile.malicious-csrf-page .
docker build -t patrickhalasik/chamilo-csrf:1.11.10 -f csrf-poc/Dockerfile.chamilo .

Docker compose run script:
docker compose -f csrf-poc/compose.yaml up -d