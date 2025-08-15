# Prática 2
## Docker

### Requisitos

1. Instalar o **Docker**  
   👉 [Guia oficial para Debian/Ubuntu](https://docs.docker.com/engine/install/debian/)

---

### Principais comandos do Docker

- Testar a instalação  
  ```bash
  docker run hello-world
  ```

- Listar containers em execução  
  ```bash
  docker container ls
  ```

- Listar todas as imagens locais  
  ```bash
  docker image ls
  ```

- Ver detalhes de um container ou imagem  
  ```bash
  docker inspect <id|nome>
  ```

- Ver histórico de camadas de uma imagem  
  ```bash
  docker history <imagem>
  ```

- Parar um container em execução  
  ```bash
  docker container stop <id|nome>
  ```

- Remover um container  
  ```bash
  docker container rm <id|nome>
  ```

- Ver logs de um container  
  ```bash
  docker container logs <id|nome>
  ```

- Ver processos rodando dentro de um container  
  ```bash
  docker container top <id|nome>
  ```

- Executar um comando interativo dentro de um container  
  ```bash
  docker exec -it <id|nome> bash
  ```

---

### Links úteis

- [Documentação oficial do Docker](https://docs.docker.com/)  
- [Referência da CLI do Docker](https://docs.docker.com/engine/reference/commandline/docker/)  
