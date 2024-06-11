# Again some of the commands not recognised
$ScriptParameters = @{
  Path = "/Users/willy/Documents/powershell-tutorial/pestertest.ps1"
  Parameters = @{
    ComputerName = '111.111.111.111'
    Credentials = Get-Credential
  }
}

Invoke-Pester -Script $ScriptParameters -OutputFile "./output.xml" -OutputFormat NUnitXML 