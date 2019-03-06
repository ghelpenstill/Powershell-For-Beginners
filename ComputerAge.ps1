<# will display three columns. One with the computer name, one with the day it was created, 
and one with the last day it was loggged into. I find this useful to find my old computers that
are still kickin'#>

function ComputerAge{
get-adcomputer -Properties  name, whencreated, lastlogondate -filter * | Select-Object Name, WhenCreated, lastlogondate | sort-object WhenCreated -Descending
}
