# Mon IP

docker build -t whatsmyip:latest .

docker run -d --name mon-ip --restart unless-stopped -p 80:8091 whatsmyip:latest

echo "TOKEN" | docker login ghcr.io -u DocKob --password-stdin

docker build -t ghcr.io/dockob/whatsmyip:latest .

docker push ghcr.io/dockob/whatsmyip:latest