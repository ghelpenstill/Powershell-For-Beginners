function Get-UserLastLogin {
#This function requires you to be logged into a server via 
#PsRemoting or ran directly on a AD Server

#Assigns the username to the Variable $user
$user = Read-Host "Enter Employee Username"
#Gets the name and the last logon of the user specified
Get-ADuser -identity $user -Properties name,lastLogon | Select name, @{Name="lastLogon";Expression={[datetime]::FromFileTime($_.'lastLogon')}} | sort-object  lastlogon -descending
}