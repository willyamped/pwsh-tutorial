# This script has many commands not found on MacOS
$env:COMPUTERNAME

$testBlock = {Write-Output "This is a scriptblock"}

& $testBlock

$Creds = Get-Credential

$someVariable = "This is from Willy's MacOS"

# someVariable is local, so it won't be read in the script block
Invoke-Command -ComputerName "111.111.111.111" -Credential $Creds -ScriptBlock {
  Write-Output "This is running on $($env:COMPUTERNAME) and $($someVariable)"
}

# 1st way of passing local variable to remote
Invoke-Command -ComputerName "111.111.111.111" -Credential $Creds -ScriptBlock {
  Write-Output "This is running on $($env:COMPUTERNAME) and $($args[0])"
} -ArgumentList $someVariable

# 2nd way (preferred)
Invoke-Command -ComputerName "111.111.111.111" -Credential $Creds -ScriptBlock {
  Write-Output "This is running on $($env:COMPUTERNAME) and $($using:someVariable)"
}

$users = Invoke-Command -ComputerName "111.111.111.111" -Credential $Creds -ScriptBlock {
  get-aduser -filter * -server willy.ca
}

$users | select name

# Create a persistent session
$session=New-PSSession -ComputerName 111.111.111.111 -Credential $Creds

Enter-PSSession -Session $session

Exit-PSSession

# $test is persisted across different invoke commands
Invoke-Command -Session $session -ScriptBlock {
  $test = "Testing"
}
Invoke-Command -Session $session -ScriptBlock {
  Write-Output $test
}

Get-PSSession

Disconnect-PSSession -Session $session
Remove-PSSession -Session $session