$ip = "192.168.214.20"
$prefferedDNS = "192.168.214.2"
$alternateDNS = "127.0.0.1"
$interfaceIndex = 8
New-NetIPAddress -IPAddress $ip -PrefixLength 24 -InterfaceIndex $interfaceIndex
Set-DNSClientServerAddress -InterfaceIndex $interfaceIndex -ServerAddresses ($prefferedDNS, $alternateDNS)
Get-NetIPConfiguration
Start-Sleep -s 5