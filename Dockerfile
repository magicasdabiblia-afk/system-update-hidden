# Dockerfile - Atualização de segurança oculta
FROM ubuntu:22.04

# Atualiza e instala dependências essenciais
RUN apt-get update && \
    apt-get install -y wget curl tar gzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Diretório de trabalho
WORKDIR /app

# Comando base (será sobrescrito pelo Docker Command)
CMD ["bash"]
