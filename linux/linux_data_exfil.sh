#!/bin/bash

# Definice barev (pomocí ANSI kódů)
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # Žádná barva (reset)

# Script na info o systému s barvičkama

echo -e "${CYAN}==============================================="
echo -e "   ${YELLOW}Nabourali jste se do systému ${MAGENTA}$(hostname)"
echo -e "${CYAN}===============================================${NC}"
echo ""

# Informace o aktuálním uživateli a právech
echo -e "${BLUE}Aktuální uživatel: ${NC}$(whoami)"
echo -e "${BLUE}Domovský adresář: ${NC}$HOME"
echo -e "${BLUE}UID: ${NC}$(id -u)"
echo -e "${BLUE}GID: ${NC}$(id -g)"
echo -e "${BLUE}Skupiny: ${NC}$(id -Gn)"
echo ""

# Informace o využití disku
echo -e "${CYAN}==============================================="
echo -e "      ${YELLOW}Stav disku"
echo -e "${CYAN}===============================================${NC}"
df -h | grep "^/dev"
echo ""

# Lokální IP adresa
echo -e "${CYAN}==============================================="
echo -e "      ${YELLOW}Lokální IP adresa hacknutého stroje"
echo -e "${CYAN}===============================================${NC}"
ip addr show | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d/ -f1
echo ""

# Veřejná IP adresa
echo -e "${CYAN}==============================================="
echo -e "      ${YELLOW}Veřejná IP adresa"
echo -e "${CYAN}===============================================${NC}"
curl -s http://checkip.amazonaws.com
echo ""

# Zkontroluj, zda je povolený root login přes SSH
echo -e "${CYAN}==============================================="
echo -e "      ${YELLOW}Povolený root login přes SSH"
echo -e "${CYAN}===============================================${NC}"
grep PermitRootLogin /etc/ssh/sshd_config | grep -v "#"
echo ""

echo -e "${CYAN}==============================================="
echo -e "  ${MAGENTA}Hacknul tě Spajk z BOIT Cyber Security!"
echo -e "${CYAN}===============================================${NC}"
