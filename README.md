# Mon IP

docker build -t whatsmyip:latest .

docker run -d --name mon-ip --restart unless-stopped -p 80:8091 whatsmyip:latest