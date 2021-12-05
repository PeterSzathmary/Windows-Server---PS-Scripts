$firstName = Read-Host "Enter first name"
$lastName = Read-Host "Enter last name"
$samAccountName = "$($firstName.Substring(0, 1))$lastName".ToLower()
$password = Read-Host "Enter a default password"
$defaultPassword = ConvertTo-SecureString $password -AsPlainText -Force

New-ADUser -Name "$firstName $lastName" -GivenName $firstName -Surname $lastName -UserPrincipalName "$firstName.$lastName@windows.lab" -SamAccountName $samAccountName -AccountPassword $defaultPassword -Path "OU=USERS,OU=MYOU,DC=WINDOWS,DC=LAB"
Set-ADUser -Identity $samAccountName -ChangePasswordAtLogon $true

Enable-ADAccount -Identity $samAccountName