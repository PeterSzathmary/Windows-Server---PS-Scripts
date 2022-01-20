# OS Info
Write-Host "Getting OS info ..." -ForegroundColor Cyan
$OSInfo = Get-ComputerInfo | Select-Object -Property WindowsProductName,OsVersion,OsArchitecture

cls

# Hardware Info
Write-Host "Getting HW info ..." -ForegroundColor Cyan
$HWInfo = Get-ComputerInfo | Select-Object -Property CsManufacturer,CsModel

cls

# BIOS Info
Write-Host "Getting BIOS info ..." -ForegroundColor Cyan
$BIOSInfo = Get-ComputerInfo | Select-Object -Property BiosName,BiosSeralNumber

cls

Write-Host -NoNewline -ForegroundColor Green "`nOS info below:"
$OSInfo | Out-Host
Write-Host -NoNewline -ForegroundColor Green "HW info below:"
$HWInfo | Out-Host
Write-Host -NoNewline -ForegroundColor Green "BIOS info below:"
$BIOSInfo | Out-Host

Write-Host -NoNewline "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');