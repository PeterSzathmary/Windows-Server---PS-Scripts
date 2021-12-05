$computerName = hostname.exe
Enable-ADOptionalFeature -Identity "Recycle Bin Feature" -Scope ForestOrConfigurationSet -Target "windows.lab" -Server $computerName -Confirm:$false