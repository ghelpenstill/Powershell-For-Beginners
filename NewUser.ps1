function newuser {
#Assigns first and last name to variables $f and $l
$f = Read-Host "Enter users First Name"
$l = Read-Host "Enter users Last Name" 

#Assigns username to variable $user
$user = Read-Host "Please enter username of member"

#This section makes sure that user does not already exsist
$result = [bool] (Get-ADUser -Filter { SamAccountName -eq $user}) 

If ($result -eq $false){
     }
Else 
     {if ( Surname -eq $l){
            "User Already Exists, Enter new User"
            }
      Else{
            $user = $user + 1
            }
    } 

#This section uses the variables to create the new user
#It then creates a homefolder thats the users first initial and last name
New-aduser -enabled $True -accountpassword (ConvertTo-SecureString <#enter password#> -AsPlainText -Force) -homedrive "U" -homedirectory "\\server\share\%username%" -ChangePasswordAtLogon $True -givenname $f -surname $l -name ($f +' ' + $l) -displayname ($f +' ' + $l) -SamAccountName $user

#This is a user interface that appears so you dont have to remember how to type every group 
#exactly right
Write-host("==============================")
Write-host("|1. Group1                   |")
Write-host("|2. Group2                   |")
Write-host("|3. Group3                   |")
Write-host("==============================")
$groups = Read-Host("Please enter group number")

#An if statement that assigns a group to the variable $groups depending on the number entered
#into the interface above
If ($groups -eq 1){
$groups = 'Group1'
} 
elseif ($groups -eq 2){
$groups = 'Group2'
} 
elseif ($groups -eq 3){
$groups = 'Group3'
}

#The part that uses the $groups variable and adds the user to it.
add-adgroupmember -identity ($groups) -members $user 
New-Item -ItemType Directory -path \\server\share\$user
}