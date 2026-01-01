#!/bin/bash

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
    echo "Uso: $0 <dominio.com>"
    exit 1
fi

echo "--- Iniciando teste de Zone Transfer para: $DOMAIN ---"

for server in $(host -t ns "$DOMAIN" | cut -d " " -f4 | sed 's/\.$//'); do
    echo "Tentando servidor: $server"
    host -l "$DOMAIN" "$server"
    echo "----------------------------------------------------"
done