# Prática 2
## Containers / Docker

### Requisitos

1 - Instalar o docker: https://docs.docker.com/engine/install/

### Principais instruções do Dockerfile

`docker build -t nginx_fast:v1 -t nginx_fast:latest .`

`docker run -d --name demo-nginx -p 80:80 nginx_fast:v1`

# 📌 Principais Instruções do Dockerfile

Um **Dockerfile** é um arquivo de instruções que define como construir uma imagem Docker.  
Aqui estão as diretivas mais comuns:

---

### 🔹 FROM
Define a **imagem base** que será usada para construir a nova imagem.  
```dockerfile
FROM ubuntu:20.04
```

### 🔹 LABEL
Adiciona metadados à imagem (autor, versão, descrição etc.). 
```dockerfile
LABEL maintainer="ana@exemplo.com" \
      version="1.0" \
      description="Imagem de exemplo para aula"
```


### 🔹 RUN
Executa comandos durante o build da imagem. 
```dockerfile
RUN apt-get update && apt-get install -y curl
```


### 🔹 COPY
Copia arquivos/diretórios do host para a imagem.
```dockerfile
COPY app/ /usr/src/app/
```

### 🔹 ADD
Similar ao COPY, mas com recursos extras:

- Pode baixar arquivos de uma URL.

- Pode extrair arquivos .tar automaticamente.
```dockerfile
ADD https://example.com/app.tar.gz /opt/
```

### 🔹 CMD
Define o comando padrão que roda ao iniciar o container. Pode ser sobrescrito no docker run.
```dockerfile
CMD ["python3", "app.py"]
```

### 🔹 ENTRYPOINT
Define o processo principal do container, que não é facilmente sobrescrito.
```dockerfile
ENTRYPOINT ["python3", "app.py"]
```

### 🔹 ENV
Define variáveis de ambiente na imagem.
```dockerfile
ENV APP_ENV=production
```

### 🔹 EXPOSE
Indica qual porta a aplicação dentro do container usa (documentação apenas, não abre a porta).
```dockerfile
EXPOSE 8080
```

### 🔹 USER
Especifica qual usuário será usado para rodar os processos dentro do container.
```dockerfile
USER appuser
```


### Links interessantes

- Documentação Dockerfile: https://docs.docker.com/reference/dockerfile/
