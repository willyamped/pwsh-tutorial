$csvFilePath = "/Users/willy/Documents/powershell-tutorial/commatest.csv"

$employeeData = Import-Csv -Path $csvFilePath

foreach($employee in $employeeData) {
  Write-Output "Employee $($employee.Name) is a $($employee.TItle) from $($employee.Country)"
}

Get-Service | Select-Object -Property Name, DisplayName, Status, StartType, @{Name = "Time"; Expression = {Get-Date -Format "MM-dd-yyyy HH:mm:ss"}} | Export-Csv -Path "/Users/willy/Documents/powershell-tutorial/export.csv" -Delimeter ",", -NoTypeInformation