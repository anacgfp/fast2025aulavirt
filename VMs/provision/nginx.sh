#! /bin/bash

sudo apt-get update
sudo apt-get install -y nginx

echo "<!DOCTYPE html>
<html>
<head>
  <title>Hello World</title>
</head>
<body>
  <h1>Hello World from Nginx!</h1>
</body>
</html>" | sudo tee /var/www/html/index.html > /dev/null

# Ativa e inicia o Nginx
sudo systemctl enable nginx
sudo systemctl restart nginx

# Mostra status
sudo systemctl status nginx --no-pager