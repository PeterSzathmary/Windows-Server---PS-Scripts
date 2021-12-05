$newName = Read-Host "New Name for Computer"
Rename-Computer -NewName $newName -Restart