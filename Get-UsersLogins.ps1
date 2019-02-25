function Get-UsersLogins {
#This function requires you to be logged into an AD 
#Server using either PS Remoting or ran Directly on
#The AD Server

#This gets the last log in for all the users that are enabled.
#This method is much more accurate than just selecting the 
#lastLogonDate property from Get-ADuser

#This filters only enabled users using {(enabled -eq $true)} 
#change it to $false if needed

Get-ADuser -Properties name,lastLogon -Filter {(enabled -eq $true)} | Select name, @{Name="lastLogon";Expression={[datetime]::FromFileTime($_.'lastLogon')}} | sort-object  lastlogon -descending
}