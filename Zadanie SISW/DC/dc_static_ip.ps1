$ip = "192.168.214.2"
$prefferedDNS = "8.8.8.8"
$alternateDNS = "127.0.0.1"
New-NetIPAddress -IPAddress $ip -PrefixLength 24 -InterfaceIndex 5
Set-DNSClientServerAddress -InterfaceIndex 5 -ServerAddresses ($prefferedDNS,$alternateDNS)