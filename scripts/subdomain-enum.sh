#!/bin/bash
# Script de enumeración de subdominios
# Uso: ./subdomain-enum.sh dominio.com

if [ -z "$1" ]; then
    echo "Uso: $0 <dominio>"
    exit 1
fi

DOMAIN=$1
echo "[*] Iniciando enumeración para: $DOMAIN"

# Usar múltiples herramientas
echo "[*] Ejecutando Subfinder..."
subfinder -d $DOMAIN -o subfinder.txt

echo "[*] Ejecutando Amass..."
amass enum -d $DOMAIN -o amass.txt

echo "[*] Combinando resultados..."
cat subfinder.txt amass.txt | sort -u > subdominios.txt

echo "[+] Enumeración completada. Resultados en: subdominios.txt"
