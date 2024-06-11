param(
  $ComputerName,
  $Credentials
)

Describe 'Checking deployment' {
  Context 'Checking windows services' {
    It 'Making sure the print spooler is stopped' {
      $Service = Invoke-Command -ComputerName $ComputerName -Credential $Credentials -ScriptBlock {
        Get-Service Spooler
      }
      $Service.status | Should be 'Stopped'
    }
  }
}