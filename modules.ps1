New-ModuleManifest -Path "/Users/willy/Documents/powershell-tutorial/Configurations/Configurations.psd1" -Author "Willy" -Description "This is the configuration module" -ModuleVersion "1.0.0" -RootModule "Configurations.psm1"

Import-Module "/Users/willy/Documents/powershell-tutorial/Configurations" -Force

Get-Command -Module Configurations

Get-Help Get-Configuration -Full