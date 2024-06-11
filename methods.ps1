function Create-Configuration {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [string]$Name,
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]$Version="1.0.0",
    [Parameter(Mandatory)]
    [string]$Path,
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateSet("MacOS", "Linux", "Windows")]
    [string]$OperatingSystem="MacOS"
  )

  # only run once
  begin {
    Write-Verbose "Begin block"
    $CounterPassed = 0
    $CounterFailed = 0
  }

  # need this to iterate all values from pipeline
  process {
    try {
      Write-Verbose "Creating configuration for $Name with version $Version"
      New-Item -Path $Path -Name "$($Name).cfg" -ItemType File -ErrorAction Stop
      $Version | Out-File -FilePath "$Path/$($Name).cfg" -Force
      $OperatingSystem | Out-File -FilePath "$Path/$($Name).cfg" -Append -Force
      Write-Verbose "Configurations created for $Name"
      $CounterPassed++
    } catch {
      Write-Output $_.Exception.Message
      Write-Verbose "Failed creating config for $Name"
      $CounterFailed++
    }
    Write-Debug "Configurations created: $CounterPassed"
    Write-Debug "Configurations failed: $CounterFailed"
  }

  # only run once
  end {
    Write-Verbose "End Block"
    Write-Output "Configurations created: $CounterPassed"
    Write-Output "Configurations failed: $CounterFailed"
  }
}

$ConfigPath="/Users/willy/Documents/powershell-tutorial/Configs"

# $Names = @('TestConfig1', 'TestConfig2', 'TestConfig3')
# $Names | Create-Configuration -Path $ConfigPath -Verbose -Debug

# $IISServer = New-Object -TypeName PSCustomObject
# Add-Member -InputObject $IISServer -MemberType NoteProperty -Name "Name" -Value "IISServer2024"
# Add-Member -InputObject $IISServer -MemberType NoteProperty -Name "Version" -Value "1.0.3"
# Add-Member -InputObject $IISServer -MemberType NoteProperty -Name "OperatingSystem" -Value "Windows"

# $IISServer | Create-Configuration -Path $ConfigPath

$Servers = Import-Csv -Path "/Users/willy/Documents/powershell-tutorial/servers.csv" -Delimiter ','

$Servers | Create-Configuration -Path $ConfigPath -Verbose