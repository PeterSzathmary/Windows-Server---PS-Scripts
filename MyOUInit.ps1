New-ADOrganizationalUnit -Name "MyOU" -Path "DC=WINDOWS,DC=LAB" -ProtectedFromAccidentalDeletion $true
New-ADOrganizationalUnit -Name "Users" -Path "OU=MYOU,DC=WINDOWS,DC=LAB" -ProtectedFromAccidentalDeletion $true
New-ADOrganizationalUnit -Name "Security Groups" -Path "OU=MYOU,DC=WINDOWS,DC=LAB" -ProtectedFromAccidentalDeletion $true