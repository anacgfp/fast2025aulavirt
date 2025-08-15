# Prática 3
## Publicando uma imagem no Docker Hub

### O que é o Docker Hub?
O **Docker Hub** é um registro público de imagens Docker, usado para **armazenar, versionar e compartilhar** imagens.  
🔗 Acesse: https://hub.docker.com/

---

### Pré-requisitos
- Conta no Docker Hub (crie em https://hub.docker.com/ se ainda não tiver).
- Docker instalado e funcionando na sua máquina.
- Escolha um **LOGIN** (seu usuário do Docker Hub) para usar nos comandos abaixo.

> **Observação:** O repositório no Docker Hub costuma ser criado automaticamente no primeiro `docker push` (seu usuário precisa ter permissão).

---

## Passo a passo

> Em todos os comandos, substitua `LOGIN` pelo **seu nome de usuário** do Docker Hub.

1. (Opcional) Obter localmente a imagem de exemplo do Docker:
   ```bash
   docker pull docker/getting-started
   ```
   > ⚠️ Você **não pode** fazer `push` para `docker/getting-started` porque esse repositório é do namespace oficial `docker`. Use o **seu** namespace (`LOGIN/...`) nos próximos passos.

2. Fazer login no Docker Hub:
   ```bash
   docker login -u LOGIN
   ```
   > Será solicitado sua senha/token do Docker Hub.

3. Marcar (taguear) a imagem local com o seu namespace:
   ```bash
   docker tag docker/getting-started LOGIN/getting-started
   ```
   > A tag define o **nome completo do repositório** que você vai publicar (por padrão usa a tag `latest`).

4. Enviar sua imagem para o seu repositório no Docker Hub:
   ```bash
   docker push LOGIN/getting-started
   ```

5. (Alternativa) Construir sua **própria** imagem a partir de um `Dockerfile` e já nomeá-la no seu namespace:
   ```bash
   docker build --platform linux/amd64 -t LOGIN/getting-started .
   ```
   > A flag `--platform linux/amd64` garante compatibilidade quando você está em arquitetura diferente (ex.: Apple Silicon/ARM64) e quer publicar para AMD64.

   Depois do build, envie:
   ```bash
   docker push LOGIN/getting-started
   ```

6. Executar a imagem publicada (ou a local com o mesmo nome):
   ```bash
   docker run -dp 80:3000 LOGIN/getting-started
   ```
   > - `-d`: detache (roda em background)  
   > - `-p 80:3000`: mapeia a porta 80 do host para a 3000 do container

---

### Verificação rápida

- Listar imagens locais:
  ```bash
  docker image ls
  ```

- Conferir no navegador (se a app expõe web na porta 80):
  ```
  http://localhost:80
  ```

- Ver logs do container:
  ```bash
  docker container logs <id|nome>
  ```

- Parar e remover o container:
  ```bash
  docker container stop <id|nome>
  docker container rm <id|nome>
  ```

---

### Dicas

- Para usar uma **tag de versão** em vez de `latest`:
  ```bash
  docker tag docker/getting-started LOGIN/getting-started:v1
  docker push LOGIN/getting-started:v1
  ```

- Para sair do Docker Hub na CLI:
  ```bash
  docker logout
  ```
