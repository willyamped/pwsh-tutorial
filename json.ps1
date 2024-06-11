$jsonFilePath = "/Users/willy/Documents/powershell-tutorial/employees.json"

$jsonData = Get-Content -Path $jsonFilePath | ConvertFrom-Json

$employeeData = $jsonData.Employees

$employeeData | Where-Object Title -eq "Programmer"

# -------

$csvFilePath = "/Users/willy/Documents/powershell-tutorial/commatest.csv"

$csvData = Import-Csv -Path $csvFilePath

$csvData | ConvertTo-Json | Out-File -FilePath "/Users/willy/Documents/powershell-tutorial/csv-to-json.json"

# -------
try {
  $uri = "https://jsonplaceholder.typicode.com/todos"
  $webRequest = Invoke-WebRequest -Uri $uri -Method Get
  $onlineData = $webRequest.Content | ConvertFrom-Json
  $onlineData | Where-Object { $_.completed -eq $true }

  $jsonBody = @"
{
  "EmployeeId": "1005",
  "Name": "Willy"
}
"@
  $jsonBodyConverted = $jsonBody | ConvertFrom-Json

  $testObject = New-Object -TypeName PSCustomObject
  Add-Member -InputObject $testObject -MemberType NoteProperty -Name "EmployeeID" -Value 1006
  Add-Member -InputObject $testObject -MemberType NoteProperty -Name "Name" -Value Budi

  $body = $testObject | ConvertTo-Json

} catch {
  Write-Error "An error occurred: $_"
}
