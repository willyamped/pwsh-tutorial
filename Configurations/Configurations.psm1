function Get-Configuration {
  <#
    .DESCRIPTION
    This is the description for the get-configuration cmdlet written by Willy

    .EXAMPLE
    Get-Configuration
    This will return all configurations

    .EXAMPLE
    Get-Configuration -Name "Test"
    This will return configuration with the name of Test

    .LINK
    This is a link to my github and website
  #>
  [CmdletBinding()]
  Param()

  Write-Output "Get-Configuration function"
}
function Set-Configuration {
  [CmdletBinding()]
  Param()

  Write-Output "Set-Configuration function"
}
function New-Configuration {
  [CmdletBinding()]
  Param()

  Write-Output "Set-Configuration function"
}