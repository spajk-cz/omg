#!/bin/bash

echo -e "\033[34mSpouštění cizího scriptu a získávání systémových informací...\033[0m"

# Aktuálně přihlášený uživatel
currentUser=$(whoami)
echo -e "Aktuálně přihlášený uživatel: \033[32m$currentUser\033[0m"

# Zbývající místo na disku
diskSpace=$(df -h / | awk 'NR==2{print $4}')
echo -e "Zbývající místo na disku: \033[35m$diskSpace\033[0m"

# Název WiFi sítě
SSID=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')
echo -e "Název WiFi sítě: \033[36m$SSID\033[0m"

# Lokální IP adresa
ipAddress=$(ipconfig getifaddr en0)
echo -e "Lokální IP adresa: \033[33m$ipAddress\033[0m"

# Veřejná IP adresa
publicIP=$(curl -s ifconfig.me)
echo -e "Veřejná IP adresa: \033[31m$publicIP\033[0m"


echo -e "\033[34mInformace byly získány.\033[0m"
echo -e "|"
echo -e "|"
echo -e "|"
echo -e "|"
echo -e "|"
echo -e "|"
echo -e "V"
echo -e "\033[31mTato a další data by mohla být odeslána na útočníkův server. Považujte tímto počítač za kompromitovaný.\033[0m"




#Toto zjistí na macOS heslo k aktuálně přihlášené wifi - je třeba zadat username a pass
#SSID=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}') | security find-generic-password -ga "$SSID" | grep "password:"


echo "   ____   ____ _____ _______    _____      _                  _____                      _ _          "
echo "  |  _ \ / __ \_   _|__   __|  / ____|    | |                / ____|                    (_) |         "
echo "  | |_) | |  | || |    | |    | |    _   _| |__   ___ _ __  | (___   ___  ___ _   _ _ __ _| |_ _   _  "
echo "  |  _ <| |  | || |    | |    | |   | | | | '_ \ / _ \ '__|  \___ \ / _ \/ __| | | | '__| | __| | | | "
echo "  | |_) | |__| || |_   | |    | |___| |_| | |_) |  __/ |     ____) |  __/ (__| |_| | |  | | |_| |_| | "
echo "  |____/ \____/_____|  |_|     \_____\__, |_.__/ \___|_|    |_____/ \___|\___|\__,_|_|  |_|\__|\__, | "
echo "                                      __/ |                                                     __/ | "
echo "                                     |___/                                                     |___/  "
