Set-Service -Name MSiSCSI -StartupType Automatic
Start-Service -Name MSiSCSI
New-IscsiTargetPortal -TargetPortalAddress "192.168.214.3"
Connect-IscsiTarget -AuthenticationType "NONE" -NodeAddress "iqn.1991-05.com.microsoft:win-fs-01-iscsitarget1-target" -TargetPortalAddress "192.168.214.3"
Get-Disk | Where-Object IsOffline -Eq $True | Set-Disk -IsOffline $False
$diskNumber = Get-Disk -FriendlyName "MSFT*" | Select-Object -ExpandProperty "Number"
Initialize-Disk -Number $diskNumber
New-Partition -DiskNumber $diskNumber -AssignDriveLetter -UseMaximumSize | Format-Volume -FileSystem NTFS -AllocationUnitSize 4096 -Confirm:$false -Force 