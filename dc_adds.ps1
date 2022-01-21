# Install Active Directory Domain Services.
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

$secureString = ConvertTo-SecureString "Start123" -AsPlainText -Force

# Create a new forest and domain named windows.lab
Install-ADDSForest -DomainName windows.lab -InstallDNS -SafeModeAdministratorPassword $secureString -Confirm:$false