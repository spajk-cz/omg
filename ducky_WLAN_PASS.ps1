# Získání seznamu uložených WiFi profilů
$wifiProfiles = netsh wlan show profiles | Select-String -Pattern "All User Profile" | ForEach-Object {
    $_ -replace ".*: ", ""
}

# Získání hesel pro každý profil
foreach ($profile in $wifiProfiles) {
    $wifiPassword = (netsh wlan show profile name=$profile key=clear | Select-String "Key Content" | ForEach-Object {
        $_ -replace ".*: ", ""
    }).Trim()

    if ($wifiPassword) {
        Write-Output "Profile: $profile, Password: $wifiPassword"
    } else {
        Write-Output "Profile: $profile, Password: Not set/Available"
    }
}
