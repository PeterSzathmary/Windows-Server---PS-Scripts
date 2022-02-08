[System.Collections.ArrayList]$computers = Get-ADComputer -Filter * -Properties * | Select-Object -ExpandProperty Name
$domain = Get-WmiObject -Namespace root\cimv2 -Class Win32_ComputerSystem | Select-Object -ExpandProperty Domain
Write-Host "All computers in domain: $($domain)" -ForegroundColor Green
$computers.Remove($computers[0])
Write-Host $computers

Invoke-Command -ComputerName $computers -ScriptBlock {
    Stop-Computer $(HOSTNAME.EXE) -Force
}

Stop-Computer $env:COMPUTERNAME -Force