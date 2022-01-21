<# $password = "Start123"
$passwordSS = ConvertTo-SecureString -String $password -AsPlainText -Force
$passCred = New-Object PSCredential([pscustomobject]@{
    UserName = $null
    Password = $passwordSS[0]
})
Add-Computer -DomainName "windows.lab" -Options UnsecuredJoin,PasswordPass -Credential $passCred #>


<# $Username = "WINDOWS\Administrator"
$Password = "Start123"
[SecureString]$Securepassword = $Password | ConvertTo-SecureString -AsPlainText -Force 
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, $Securepassword
Add-Computer -DomainName "windows.lab" -Credential $credential #>

<# $dc = "windows.lab"
$pw = "Start123" | ConvertTo-SecureString -asPlainText -Force
$usr = "Administrator"
$username = "$dc\$usr"
$creds = New-Object System.Management.Automation.PSCredential($usrername,$pw)
Add-Computer -DomainName $dc -Credential $creds
Read-Host -Prompt "Press Enter to exit"
Start-Sleep -s 15

Restart-Computer #>

<# $Username = "WINDOWS\administrator"
$Password = "Start123"
[SecureString]$Securepassword = $Password | ConvertTo-SecureString -AsPlainText -Force 
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, $Securepassword
Add-Computer -DomainName "windows.lab" -Credential $credential
Start-Sleep -s 25 #>