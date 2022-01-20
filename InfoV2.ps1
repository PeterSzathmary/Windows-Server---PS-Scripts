#Write-Host "Getting info ..." -ForegroundColor Cyan
#Write-Host "Getting OS info ..." -ForegroundColor Cyan
$OSInfo = Get-WmiObject -Class Win32_OperatingSystem | Select-Object -Property Caption,OSArchitecture,Version
#$OSInfo | Out-Host

#cls

#Write-Host "Getting HW info ..." -ForegroundColor Cyan
$HWInfo = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -Property Manufacturer,Model
#$HWInfo | Out-Host

#cls

#Write-Host "Getting BIOS info ..." -ForegroundColor Cyan
$BIOSInfo = Get-WmiObject -Class Win32_Bios | Select-Object -Property Name,SerialNumber

cls

Write-Host "`n`tOS info below"
$OSInfo | Out-Host

Write-Host "`tHW info below"
$HWInfo | Out-Host

Write-Host "`tBIOS info below"
$BIOSInfo | Out-Host

Write-Host -NoNewline "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');