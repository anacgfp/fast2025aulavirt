docker build -t getting-started .

docker run -dp 3000:3000 getting-started

docker volume create todo-db

docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started

docker volume inspect