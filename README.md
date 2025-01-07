## How to build the 2 images

At the source of the project:

Build the 2 images:
docker build -t patrickhalasik/chamilo-malicious-csrf-page:1.11.12 -f Dockerfile.malicious-csrf-page .
docker build -t patrickhalasik/chamilo-csrf:1.11.12 -f Dockerfile.chamilo .

Docker compose run script:
docker compose up -d