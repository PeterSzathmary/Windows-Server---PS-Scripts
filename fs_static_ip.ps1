$ip = "192.168.214.10"
$prefferedDNS = "192.168.214.2"
$alternateDNS = "127.0.0.1"
$intI = 5
New-NetIPAddress -IPAddress $ip -PrefixLength 24 -InterfaceIndex $intI
Set-DNSClientServerAddress -InterfaceIndex $intI -ServerAddresses ($prefferedDNS, $alternateDNS)
Get-NetIPConfiguration
Start-Sleep -s 5