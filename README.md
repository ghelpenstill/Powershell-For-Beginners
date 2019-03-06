# PowerShell for Beginner SysAdmin
My compilitaion of simple but time saving scripts that I have made 
up over my last year of SysAdmin/Help Desk work. All of these were 
created In PowerShell ISE V1.0. I am not sure if that could mean potential 
issues for those running other programs that work with powershell, just keep that in 
mind.

#Getting Started
Keep in mind that most all of these scripts are made to be run on a DC with AD
in place. Many of these scripts are useless on a client computer unless used while 
remoting into the server via PSsession.

#When running on a client computer using PSsession.
Both computers need to have the command enable-Psremoting run on them.
If it blocks you try running as administrator. After running this command
you should see a box pop up. You will need to click yes on both the client 
computer and the server to be able to remote into the server. 

Please check with higer level administrators that opening this port is allowed.

#Remoting to the server.
Run the command 

enter-pssession -computername <the DC server>

This should allow you to connect to the server and run all of the scripts that I have
while still only using your client Powershell window. 
