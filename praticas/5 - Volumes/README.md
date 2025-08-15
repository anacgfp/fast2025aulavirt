# Prática 4
## Docker Volumes (Persistência de Dados)

### O que são volumes?
**Volumes** são a forma recomendada de **persistir dados** de containers no Docker. Diferente do sistema de arquivos efêmero do container, dados gravados em volumes **sobrevivem** a `stop`, `rm` e recriações do container.

> ✅ Nesta prática, você verá a diferença entre rodar **sem** volume (dados se perdem) e **com** volume (dados persistem).

---

### Pré-requisitos
- Docker instalado e funcionando.
---

## A) Rodando **sem** volume

1. Subir o container **sem** volume:
   ```bash
   docker run -d -p 80:80 andreffcastro/my-app-todo:v1.0
   ```
   > A aplicação escreve os dados em `/etc/todos` **dentro** do container.

2. Abra a aplicação (ex.: http://localhost:80), **crie/edite itens**, depois **derrube** o container:
   ```bash
   docker ps
   docker container stop <id|nome>
   docker container rm <id|nome>
   ```

3. Suba novamente **sem** volume e verifique:
   ```bash
   docker run -d -p 80:80 andreffcastro/my-app-todo:v1.0
   ```
   ➜ Os dados **não estarão mais lá** (foram perdidos com a remoção do container).

---

## B) Rodando **com** volume (dados PERSISTEM)

1. Criar um **volume nomeado**:
   ```bash
   docker volume create todo-db
   ```

2. Subir o container com **mount** do volume em `/etc/todos`:
   ```bash
   docker run -dp 80:3000 \
    --mount type=volume,src=todo-db,target=/etc/todos \
    andreffcastro/my-app-todo:v1.0
   ```
   > Alternativa com `-v`: `-v todo-db:/etc/todos`

3. Use a aplicação (http://localhost:80), **crie/edite itens**.  
   Em seguida, **pare e remova** o container:
   ```bash
   docker ps
   docker container stop <id|nome>
   docker container rm <id|nome>
   ```

4. Suba **de novo** com o mesmo volume:
   ```bash
   docker run -dp 80:3000 \
    --mount type=volume,src=todo-db,target=/etc/todos \
    andreffcastro/my-app-todo:v1.0
   ```
   ➜ Agora os dados **continuam lá** (foram preservados no volume `todo-db`).

---

## Comandos de referência (Volumes)

1. Criar volume:
   ```bash
   docker volume create todo-db
   ```

2. Subir com volume montado:
   ```bash
   docker run -dp 80:3000 \
     --mount type=volume,src=todo-db,target=/etc/todos \
     getting-started
   ```

3. Inspecionar volume:
   ```bash
   docker volume inspect todo-db
   ```

---

### Verificações úteis

- Listar volumes:
  ```bash
  docker volume ls
  ```

- Verificar mounts do container:
  ```bash
  docker container inspect <id|nome> --format '{{ json .Mounts }}' | jq
  ```

- Ver arquivos gravados no caminho do app:
  ```bash
  docker exec -it <id|nome> sh -c "ls -lah /etc/todos && cat /etc/todos/* 2>/dev/null || true"
  ```

---

### Limpeza (CUIDADO: remove dados!)

- Remover o container:
  ```bash
  docker rm -f <id|nome>
  ```

- Remover o volume (apaga os dados):
  ```bash
  docker volume rm todo-db
  ```

- Remover volumes “órfãos”:
  ```bash
  docker volume prune
  ```

---

### Resumo
- **Sem volume**: dados são apagados ao remover o container.  
- **Com volume**: dados persistem entre recriações do container.  
- Use `--mount type=volume,src=<nome>,target=<path>` para persistir os dados da sua aplicação.
