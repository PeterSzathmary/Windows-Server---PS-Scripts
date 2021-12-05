$ip = Read-Host "New IP Address"
$primaryDNS = Read-Host "Set primary DNS"
$secondaryDNS = Read-Host "Set secondary DNS"
$numberOfAdapter = Read-Host "What adapter are you configuring"
$interfaceIndex = Get-NetIPConfiguration | Where-Object -FilterScript {$_.InterfaceDescription.Contains($numberOfAdapter)} | Select-Object -ExpandProperty InterfaceIndex

New-NetIPAddress -IPAddress $ip -PrefixLength 24 -InterfaceIndex $interfaceIndex
Set-DnsClientServerAddress -InterfaceIndex $interfaceIndex -ServerAddresses ($primaryDNS, $secondaryDNS)