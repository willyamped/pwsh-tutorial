function Create-Configuration {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, ValueFromPipeline)]
    [string]$Name,
    [Parameter()]
    [string]$Version="1.0.0",
    [Parameter(Mandatory)]
    [string]$Path,
    [Parameter()]
    [ValidateSet("MacOS", "Linux")]
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
      $CounterPassed++
    } catch {
      Write-Output $_.Exception.Message
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

$Names = @('TestConfig1', 'TestConfig2', 'TestConfig3')
$Names | Create-Configuration -Path $ConfigPath -Verbose -Debug
