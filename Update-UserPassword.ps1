function Update-UserPassword {
#This function requires you to be logged into the AD Server
#Via PSRemoting or ran directly on the server

#Assigns the username to the Variable $user
$username = Read-Host "Enter Employee Username"

#assigns the new password to the variable $newpass
$newpass = Read-host "Enter New Password"

#this sets the new password to the value of variable $newpass
Set-ADAccountPassword -Identity $username -NewPassword (ConvertTo-SecureString -AsPlainText $newpass -Force)