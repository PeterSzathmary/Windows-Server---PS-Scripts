Get-NetIPConfiguration
$width = [Console]::WindowWidth
Write-Host ("-" * $width + "`n")
Write-Host "Please enter which interface you want to configure." -ForegroundColor Green
$numberOfAdapter = Read-Host "Choose the interface index"
$ip = Read-Host "New IP Address"
$primaryDNS = Read-Host "Set primary DNS"
$secondaryDNS = Read-Host "Set secondary DNS"
$interfaceIndex = Get-NetIPConfiguration | Where-Object -FilterScript {$_.InterfaceDescription.Contains($numberOfAdapter)} | Select-Object -ExpandProperty InterfaceIndex

New-NetIPAddress -IPAddress $ip -PrefixLength 24 -InterfaceIndex $interfaceIndex
Set-DnsClientServerAddress -InterfaceIndex $interfaceIndex -ServerAddresses ($primaryDNS, $secondaryDNS)